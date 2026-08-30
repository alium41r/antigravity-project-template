# Authentication Architecture & Specifications

> [!IMPORTANT]
> **DOCUMENTATION ONLY — NO EXECUTABLE CODE**
> This directory houses authentication design documentation, provider setup guides, and session lifecycle specifications.
>
> **Where Executable Code Lives**:
> - All Supabase Auth client singletons, server session helpers (`getServerSession`), and OAuth callbacks belong strictly in [`src/lib/auth/`](../../src/lib/auth).
> - Auth page views belong in [`src/app/(auth)/`](../../src/app/\(auth\)).

## Focus Areas
- Session lifecycle and token refresh specifications
- Supported OAuth providers and account-linking rules
- Multi-Factor Authentication (MFA) and Passkeys architecture
- Fallback behaviors for expired or revoked credentials
