# Edge Security Middleware Specifications

> [!IMPORTANT]
> **DOCUMENTATION ONLY — NO EXECUTABLE CODE**
> Next.js strictly requires executable middleware to reside at [`src/middleware.ts`](../../src) (or the project root).
> This directory is reserved for documenting middleware security policies, route guard rules, and HTTP header specifications.

## Focus Areas
- Route protection rules: mapping public vs. authenticated vs. role-gated URL paths
- Content Security Policy (CSP), HSTS, and X-Frame-Options header definitions
- Rate-limiting rules and edge IP throttling design
- Session cookie refresh and propagation requirements
