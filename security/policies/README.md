# Row-Level Security (RLS) Policy Specifications

> [!IMPORTANT]
> **DOCUMENTATION ONLY — NO EXECUTABLE CODE**
> This directory houses declarative RLS policy specifications, tenant isolation diagrams, and authorization designs.
>
> **Where Executable SQL Lives**:
> - All executable RLS migrations (`ALTER TABLE ... ENABLE ROW LEVEL SECURITY;`, `CREATE POLICY ...`) must be written in version-controlled SQL files inside [`supabase/migrations/*.sql`](../../supabase/migrations).

## Focus Areas
- Entity-level access control specifications (read/write/update/delete matrices)
- Multi-tenant data isolation patterns (e.g. `workspace_id` or `tenant_id` policies)
- Performance considerations for RLS query overhead and index requirements
