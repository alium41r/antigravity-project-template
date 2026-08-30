# Supabase Local Development & Database Migrations

**Owner**: Single Source of Truth for the Entire Database Lifecycle (DDL, Tables, Columns, Constraints, Enums, Indexes, Extensions, RLS, Triggers, Functions, Storage, and Seed Data).

This directory manages the Supabase local development stack and the canonical SQL migration pipeline.

---

## 📂 Contents & Architecture
- **`config.toml`**: Canonical local Supabase CLI configuration (local ports, enabled auth providers, storage, API settings, and edge runtime).
  - *Default DB Port*: Direct database connection runs on port `54322` by default. Connection pooler is on port `54329` (disabled by default).
  - *Project Customization*: Project-specific Supabase settings (such as auth redirect URLs, major Postgres versions, or external OAuth providers) may be modified here during project initialization.
  - *Security Mandate*: **Secrets must remain in environment variables, never in committed config.** The `config.toml` uses `env(VARIABLE_NAME)` references for sensitive keys. Never hardcode production credentials or private keys in this file.
- **`migrations/`**: Chronological SQL migration files (`<timestamp>_<name>.sql`) managing:
  - PostgreSQL extensions (`uuid-ossp`, `pgvector`, `pg_cron`).
  - Tables, columns, foreign keys, custom enum types, and indexes.
  - Row-Level Security enablement (`ALTER TABLE ... ENABLE ROW LEVEL SECURITY;`).
  - Declarative RLS access policies (`CREATE POLICY ...`).
  - Database triggers and stored functions (e.g. syncing `auth.users` into public user records).
  - Realtime publications and storage bucket policies.
- **`seed.sql`**: Canonical SQL script executed by `supabase db reset` to populate local development and test databases.

---

## 🔄 Daily Migration Workflow
```bash
# 1. Create a new migration file
npx supabase migration new <migration_name>

# 2. Write SQL statements in supabase/migrations/<timestamp>_<migration_name>.sql
#    (Observe migration ordering: Extensions -> Tables -> RLS/Triggers)

# 3. Apply the migration locally
npx supabase migration up

# 4. Synchronize Prisma schema and TypeScript client
npm run db:sync
```

> [!IMPORTANT]
> Supabase SQL is the **single source of truth** for all database schema changes. Prisma does not run migrations in this project. See [`architecture/database-migration-boundary.md`](../architecture/database-migration-boundary.md).
