# Authentication & Session Helpers (`src/lib/auth/`)

**Owner**: Authentication-specific helper functions, session verifiers, and role authorization helpers leveraging Supabase Auth.

---

## 📂 Responsibilities & Functions

- **`session.ts`**:
  - `getServerSession()`: Retrieves and validates the active session cookie in Server Components, Server Actions, and Route Handlers.
  - `getCurrentUser()`: Returns the authenticated user object or `null`.
  - `requireUser()`: Asserts authentication; redirects or throws an authorization error if unauthenticated.
- **`roles.ts`**:
  - `requireRole(role)`: Validates user claims against the RBAC permissions matrix.

---

## ⚠️ Client Ownership Boundary

> [!IMPORTANT]
> **No Competing Clients**: Do **not** declare or instantiate Supabase client factories in this directory.
> - Browser and server Supabase clients belong strictly in [`src/lib/db/supabase.ts`](../db/).
> - Auth helpers in this directory import and consume the canonical clients exported from `src/lib/db/`.
