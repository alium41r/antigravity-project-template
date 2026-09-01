# Data Repositories (`src/server/repositories/`)

Data access layer. Encapsulates database queries executed via Prisma client, providing a clean abstraction for domain services.

> [!IMPORTANT]
> **Authorization & Query Scoping Boundary**:
> Prisma connects as a privileged database role that bypasses PostgreSQL RLS. Every repository query and mutation must explicitly enforce tenant, user ID, or ownership scoping (e.g. `where: { id, userId: session.user.id }`). Never rely on Supabase RLS policies to restrict Prisma operations.
