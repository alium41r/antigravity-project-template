# Database & Supabase Client Singletons (`src/lib/db/`)

**Owner**: Centralized client instances and factories for database and Supabase interaction.

---

## 📂 Exports & Responsibilities

- **`prisma.ts`**: Global Prisma client singleton ensuring connection pooling functions reliably in Next.js without exhausting connections during Hot Module Replacement (HMR).
- **`supabase.ts`**: Canonical Supabase client factories utilizing `@supabase/ssr`:
  - `createBrowserClient()`: Browser-side client for Client Components.
  - `createServerClient()`: Server-side client for Server Components, Server Actions, and Route Handlers using secure HTTP-only cookies.
  - `createAdminClient()`: Service-role client for background administrative tasks (never exposed to browser).

> [!IMPORTANT]
> **Single Client Authority**: All Supabase client instantiations belong exclusively in this directory. Authentication helpers in [`src/lib/auth/`](../auth/) must import and consume the clients exported here rather than creating separate or competing client instances.
