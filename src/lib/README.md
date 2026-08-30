# Shared Libraries & Runtime Singletons (`src/lib/`)

Houses shared third-party client singletons, authentication helpers, and framework-agnostic runtime utilities.

---

## 📂 Subdirectories

- **`db/`**: Centralized database and Supabase client factories.
  - Owns `prisma.ts` (connection-pooled global Prisma client singleton).
  - Owns `supabase.ts` (canonical Supabase client factories for browser, Server Components, Server Actions, and Route Handlers via `@supabase/ssr`).
- **`auth/`**: Authentication helper functions and session utilities.
  - Owns functions like `getServerSession()`, `getCurrentUser()`, and `requireAuth()`.
  - **Client Boundary**: Consumes Supabase clients strictly from `src/lib/db/`. Never declares competing Supabase client factories.
- **`utils/`**: General-purpose, framework-agnostic utility functions.
  - Formatting, string parsing, date/time helpers, URL builders, and mathematical calculations.
  - Strictly reusable utilities; domain business logic belongs in `src/server/`.
