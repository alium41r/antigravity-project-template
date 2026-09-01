# Database Migration Pipeline & Architecture Boundary

## Executive Summary

This project enforces a **Single Migration Pipeline** architecture. 

To eliminate dual-history collisions, ordering deadlocks, and schema drift, **Supabase SQL is the sole source of truth for all database migrations**. Prisma is strictly utilized as an Object-Relational Mapping (ORM) and type-safe query client layer, driven by database introspection (`prisma db pull`).

Prisma **never** executes migrations in this repository.

---

## Division of Responsibility

| Concern | Owner | Mechanism | Location |
| :--- | :--- | :--- | :--- |
| **All Database DDL** (Tables, Columns, Constraints) | **Supabase** | `supabase migration` | `supabase/migrations/*.sql` |
| **Foreign Keys, Enums & Indexes** (B-Tree, GIN, etc.) | **Supabase** | `supabase migration` | `supabase/migrations/*.sql` |
| **PostgreSQL Extensions** (`pgvector`, `uuid-ossp`) | **Supabase** | `supabase migration` | `supabase/migrations/*.sql` |
| **Row-Level Security (RLS)** & Access Policies | **Supabase** | `supabase migration` | `supabase/migrations/*.sql` |
| **Database Functions & Triggers** (e.g. `auth.users` sync) | **Supabase** | `supabase migration` | `supabase/migrations/*.sql` |
| **Realtime Publications & Storage Buckets** | **Supabase** | `supabase migration` | `supabase/migrations/*.sql` |
| **Local Emulation & Engine Config** | **Supabase** | `supabase start` | `supabase/config.toml` |
| **Database Seed Data** | **Supabase** | `supabase db reset` | `supabase/seed.sql` |
| **Schema Representation (Derived Reference)** | **Prisma** | `prisma db pull` | `prisma/schema.prisma` |
| **TypeScript Database Client** | **Prisma** | `prisma generate` | `node_modules/@prisma/client` |
| **Application Query Execution** | **Prisma** | `prisma.<model>.*` | `src/server/repositories/` |

---

## Migration Ordering Rules

All migrations execute chronologically according to the timestamp prefix in `supabase/migrations/<timestamp>_<name>.sql`. To ensure relational integrity and dependency resolution, adhere to this sequence:

```
┌────────────────────────────────────────────────────────────────────────┐
│ PHASE 0: Extensions & Schemas (Pre-requisites)                         │
│ Example: CREATE EXTENSION IF NOT EXISTS "uuid-ossp";                   │
│          CREATE EXTENSION IF NOT EXISTS "vector";                      │
├────────────────────────────────────────────────────────────────────────┤
│ PHASE 1: Application Tables, Enums, Constraints & Indexes              │
│ Example: CREATE TYPE order_status AS ENUM (...);                       │
│          CREATE TABLE public.orders (...);                             │
├────────────────────────────────────────────────────────────────────────┤
│ PHASE 2: Row-Level Security (RLS) & Access Control Policies            │
│ Example: ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;          │
│          CREATE POLICY "Users can view own orders" ON public.orders... │
├────────────────────────────────────────────────────────────────────────┤
│ PHASE 3: Triggers, Functions & Realtime Publications                   │
│ Example: CREATE FUNCTION public.handle_new_user() ...                  │
│          CREATE TRIGGER on_auth_user_created ...                       │
└────────────────────────────────────────────────────────────────────────┘
```

1. **Extensions Before Tables**: Any extension providing data types or default functions (e.g. `pgvector`, `uuid-ossp`) must be enabled in a migration timestamped *prior* to tables referencing them.
2. **Tables Before Policies**: Tables must be created in a migration timestamped *prior* to migrations adding RLS policies, foreign key constraints from other tables, or triggers.
3. **Deterministic Execution**: The Supabase CLI executes migrations strictly in timestamp order.

---

## Canonical Operational Workflows

### 1. Fresh Local Project Setup
*Executed when onboarding a developer or cloning the repository:*
```bash
# 1. Start local Supabase Docker engine (applies all supabase/migrations/*.sql)
npx supabase start

# 2. Introspect actual database into Prisma schema
npx prisma db pull

# 3. Generate typed Prisma Client
npx prisma generate
```

### 2. Normal Schema Change Development
*Executed whenever introducing new tables, columns, indexes, or RLS policies:*
```bash
# 1. Create a new timestamped Supabase migration file
npx supabase migration new <descriptive_change_name>

# 2. Write the DDL, RLS, or trigger SQL in the newly generated file:
#    supabase/migrations/<timestamp>_<descriptive_change_name>.sql

# 3. Apply the migration locally
npx supabase migration up

# 4. Sync Prisma schema and regenerate client
npm run db:sync
# (or: npx prisma db pull && npx prisma generate)
```

### 3. Full Local Database Reset
*Executed to wipe local state and verify deterministic replay from scratch:*
```bash
# Safely drops public schema, executes all migrations, runs seed.sql, and syncs Prisma:
npm run db:reset
# (or: ./scripts/db-reset.sh)
```
`scripts/db-reset.sh` is destructive (local only): it prompts for explicit confirmation unless `--force` is passed (CI with disposable databases).
Behind the scenes, this runs:
1. `npx supabase db reset` (recreates DB, replays `supabase/migrations/*.sql`, runs `supabase/seed.sql`)
2. `npx prisma db pull` (refreshes `prisma/schema.prisma`)
3. `npx prisma generate` (regenerates `@prisma/client`)

### 4. Remote Staging & Production Deployment
*Executed in deployment pipelines or staging rollout:*
```bash
# 1. Apply pending Supabase migrations to remote linked database
npx supabase db push

# 2. CI/CD build step generates Prisma client from committed schema.prisma:
npx prisma generate

# 3. Deploy Next.js application build
npm run build
```

### 5. Continuous Integration (CI)
*Executed in automated pull request validation:*
```bash
# 1. Start local Supabase engine in CI runner
npx supabase start

# 2. Verify introspection matches committed schema.prisma with zero drift
npx prisma db pull
git diff --exit-code prisma/schema.prisma

# 3. Generate client and run test suite
npx prisma generate
npx vitest run

# 4. Tear down Supabase engine
npx supabase stop
```

---

## Golden Rules for AI Agents & Developers

1. **No Prisma Migrations**: Never run `prisma migrate dev`, `prisma migrate deploy`, or `prisma migrate reset`. The `prisma/migrations/` directory must not exist.
2. **Schema.prisma is Derived**: `prisma/schema.prisma` is an introspected representation of the database. Do not manually author structural table changes in `schema.prisma` expecting them to apply to PostgreSQL.
3. **All DDL in Supabase Migrations**: Every table, column, index, enum, extension, RLS policy, and trigger must be authored as SQL in `supabase/migrations/`.
4. **Mandatory RLS**: Every table created in `public` must have Row-Level Security enabled (`ALTER TABLE <table_name> ENABLE ROW LEVEL SECURITY;`) with explicit access policies declared before being deployed.
5. **Sync Immediately After Migration**: Always execute `npm run db:sync` (or `./scripts/db-sync.sh`) immediately after applying any migration locally so TypeScript types stay synchronized with PostgreSQL.
6. **Prisma Does Not Inherit RLS**: Prisma queries run as a privileged database role that bypasses PostgreSQL RLS over direct connections. Application queries using Prisma must explicitly scope by user ID or tenant (`where: { userId }`). RLS only guards direct client or PostgREST access via the Supabase client.
