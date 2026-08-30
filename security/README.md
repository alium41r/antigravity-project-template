# Security & Access Governance (`security/`)

> [!IMPORTANT]
> **GOVERNANCE & SPECIFICATIONS ONLY — NO EXECUTABLE CODE**
> This directory is strictly reserved for security architecture documentation, access matrices, policy specifications, and audit standards. It must **NEVER** contain executable runtime code.

---

## 🧭 Code Location Directory Map

To avoid ambiguity, executable security-related code must be placed in its idiomatic application location:

| Security Concern | Executable Code Location | Governance & Specification Location |
| :--- | :--- | :--- |
| **Authentication & Sessions** | [`src/lib/auth/`](../src/lib/auth) | [`security/auth/`](auth) |
| **Edge Security Middleware** | [`src/middleware.ts`](../src) | [`security/middleware/`](middleware) |
| **Row-Level Security (RLS) SQL** | [`supabase/migrations/*.sql`](../supabase/migrations) | [`security/policies/`](policies) |
| **Role-Based Access Control (RBAC)** | [`src/server/`](../src/server) (guards/checks) | [`security/rbac/`](rbac) (roles matrix) |
| **Audit Logging Implementation** | [`src/server/`](../src/server) (logging services) | [`security/audit/`](audit) (audit policy) |

---

## 📂 Subdirectories (Documentation & Specifications Only)

- **[`auth/`](auth/)**: Authentication flow specifications, OAuth provider requirements, session lifecycle documentation, and passkey architecture.
- **[`rbac/`](rbac/)**: Role-Based Access Control matrices, permission hierarchies, role definitions, and authorization guard specifications.
- **[`middleware/`](middleware/)**: Edge security policies, route protection rules, CSRF mitigation design, and Content Security Policy (CSP) header specifications.
- **[`policies/`](policies/)**: Declarative Row-Level Security (RLS) policy designs, tenant isolation specs, and data access diagrams.
- **[`audit/`](audit/)**: Security audit logging policies, compliance criteria, event tracking definitions, and retention rules.
