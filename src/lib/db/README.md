# Database & Supabase Client Singletons (`src/lib/db/`)

**Owner**: Centralized client instances and factories for database and Supabase interaction.

---

## 📂 Exports & Responsibilities

- **`prisma.ts`**: Global Prisma client singleton ensuring connection pooling functions reliably in Next.js without exhausting connections during Hot Module Replacement (HMR).
  - *Security Boundary*: Prisma connects with direct PostgreSQL credentials and executes queries as a privileged database role that bypasses PostgreSQL RLS. All application queries executed via Prisma must explicitly filter by tenant, user ID, or ownership (`where: { userId: session.user.id }`).
- **`supabase.ts`**: Canonical Supabase client factories utilizing `@supabase/ssr`:
  - `createBrowserClient()`: Browser-side client for Client Components (subject to Supabase RLS).
  - `createServerClient()`: Server-side client for Server Components, Server Actions, and Route Handlers using secure HTTP-only cookies (subject to Supabase RLS based on auth claims).
  - `createAdminClient()`: Service-role client for background administrative tasks (bypasses RLS; strictly server-only and privileged).

> [!IMPORTANT]
> **Single Client Authority & Security Boundary**:
> 1. All Supabase client instantiations belong exclusively in this directory. Authentication helpers in [`src/lib/auth/`](../auth/) must import and consume the clients exported here rather than creating separate or competing client instances.
> 2. Never assume Prisma queries are protected by Row-Level Security. Always enforce authorization and query scoping explicitly in application repositories and Server Actions.
