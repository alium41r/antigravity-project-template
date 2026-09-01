# Authentication Architecture & Specifications

> [!IMPORTANT]
> **DOCUMENTATION ONLY — NO EXECUTABLE CODE**
> This directory houses authentication design documentation, provider setup guides, and session lifecycle specifications.
>
> **Where Executable Code Lives**:
> - **Supabase Client Factories**: Singletons for browser, server (`@supabase/ssr`), and privileged service-role admin access belong exclusively in [`src/lib/db/supabase.ts`](../../src/lib/db/supabase.ts). Never create competing Supabase client factories in this directory.
> - **Authentication & Session Helpers**: Server session utilities (`getServerSession`, `requireUser`), session validators, and auth-specific helper logic belong in [`src/lib/auth/`](../../src/lib/auth) and must consume the clients exported from `src/lib/db/supabase.ts`.
> - **Authentication UI Pages**: Auth page views belong in [`src/app/(auth)/`](../../src/app/\(auth\)).

## Focus Areas
- Session lifecycle and token refresh specifications
- Supported OAuth providers and account-linking rules
- Multi-Factor Authentication (MFA) and Passkeys architecture
- Fallback behaviors for expired or revoked credentials
