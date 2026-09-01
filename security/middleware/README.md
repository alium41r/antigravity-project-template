# Edge Security Proxy & Request Interception Specifications

> [!IMPORTANT]
> **DOCUMENTATION & SPECIFICATIONS ONLY — NO EXECUTABLE CODE**
> Next.js 16+ deprecated the `middleware.ts` file convention in favor of a `proxy.ts` file exporting a `proxy` function. While Next.js accepts the file at the project root or inside `src/`, this template strictly requires it at [`src/proxy.ts`](../../src).
> This directory is maintained for backward-compatible documentation organization, reserved strictly for housing edge security governance, route protection specifications, and HTTP header policies. Never place executable code in this directory.

## Focus Areas
- Route protection rules: mapping public vs. authenticated vs. role-gated URL paths
- Content Security Policy (CSP), HSTS, and X-Frame-Options header definitions
- Rate-limiting rules and edge IP throttling design
- Session cookie refresh and propagation requirements
