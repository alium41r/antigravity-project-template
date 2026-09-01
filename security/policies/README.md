# Row-Level Security (RLS) & Data Access Policy Specifications

> [!IMPORTANT]
> **DOCUMENTATION ONLY — NO EXECUTABLE CODE**
> This directory houses declarative RLS policy specifications, tenant isolation diagrams, authorization designs, and Prisma data-access scoping rules.
>
> **Where Executable Code Lives**:
> - **Supabase RLS Migrations**: All executable PostgreSQL RLS policies (`ALTER TABLE ... ENABLE ROW LEVEL SECURITY;`, `CREATE POLICY ...`) must be written in version-controlled SQL files inside [`supabase/migrations/*.sql`](../../supabase/migrations).
> - **Prisma Repositories & Scoping**: Server-side Prisma operations connect through direct PostgreSQL connection strings and **do not** automatically inherit Supabase RLS protections. Explicit user/tenant filtering must be implemented in application repositories inside [`src/server/repositories/`](../../src/server/repositories) and Server Actions.

## Focus Areas
- Entity-level access control specifications (read/write/update/delete matrices)
- Supabase PostgreSQL RLS policies for browser and PostgREST client protection
- Application-layer scoping rules for Prisma repositories (preventing unauthorized cross-tenant access)
- Multi-tenant data isolation patterns (e.g. `workspace_id` or `tenant_id` policies)
- Privileged service-role and administrative operation boundaries
- Performance considerations for RLS query overhead and index requirements
