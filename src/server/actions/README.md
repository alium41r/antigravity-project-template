# Server Actions (`src/server/actions/`)

Type-safe Next.js Server Actions executing data mutations with validation and revalidation.

> [!IMPORTANT]
> **Server Action Security Boundary (Public RPC Endpoints)**:
> Next.js Server Actions (`"use server"`) compile into publicly accessible HTTP `POST` endpoints. Every Server Action performing mutations or sensitive reads must enforce the **Server Action Security Triad**:
> 1. **Validate Input**: Validate all untrusted input payloads immediately using strict Zod schemas (`safeParse`).
> 2. **Authenticate Caller**: Verify session identity server-side via `requireUser()` or `getServerSession()`.
> 3. **Authorize Ownership & Role**: Explicitly verify that the authenticated caller owns or is permitted to mutate the target resource (`where: { id, userId: session.user.id }`). Never trust client-supplied user IDs, tenant IDs, or role claims.
>
> Refer to the global **`vibe-security`** skill — specifically its `references/server-actions-and-auth.md` guide (installed in the agent's skills directory, e.g. `~/.gemini/config/skills/vibe-security/references/`) — and [`project_constitution.md`](../../../project_constitution.md) Article VII & IX.
