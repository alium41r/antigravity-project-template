# Prisma ORM & Type-Safe Client Layer

**Role**: Database schema introspection, Prisma Client generation, and type-safe query execution.

Prisma is **not** a migration runner in this project template. All database DDL, tables, columns, constraints, RLS policies, triggers, and extensions are authored and managed exclusively in [`supabase/migrations/`](../supabase/migrations/).

---

## 📂 Contents & Architecture
- **`schema.prisma`**: A **derived, committed** schema representation generated from the live database via `npx prisma db pull`. It serves as the input specification for generating `@prisma/client`.
- **No `migrations/` directory**: Prisma migrations are prohibited. Never execute `prisma migrate dev`, `prisma migrate deploy`, or `prisma migrate reset`.
- **No `seeds/` directory**: Database seeds are maintained exclusively in [`supabase/seed.sql`](../supabase/seed.sql).

---

## 🔄 Daily Workflow
Whenever database migrations are created and applied in Supabase:
```bash
# 1. Sync Prisma schema with the updated database
npx prisma db pull

# 2. Regenerate the typed TypeScript client
npx prisma generate
```
Or simply run the repository script:
```bash
npm run db:sync
```

> [!IMPORTANT]
> See [`architecture/database-migration-boundary.md`](../architecture/database-migration-boundary.md) and [`project_constitution.md`](../project_constitution.md) Article VI for authoritative governance rules.
