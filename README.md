# Modern Fullstack Project Template

A production-grade, modular template built for high-velocity web applications using **Next.js (App Router)**, **Prisma**, and **Supabase**.

---

## 🏛 Architectural Structure

This template adheres to idiomatic Next.js conventions while strictly isolating product context, technical governance, and domain logic:

```
├── .env.example         # Canonical environment variable template for local dev
├── .gitignore
├── README.md
├── brain.md             # Persistent project brain and strategic knowledge base
├── project_constitution.md # Operating doctrine and rules for AI coding agents
├── SETUP.md             # Authoritative 11-step project instantiation protocol
├── product/             # Strategic product context, vision, personas, and user journeys
├── research/            # Market research, user discovery, and technical feasibility spikes
├── specifications/      # PRDs, feature specs, user stories, acceptance criteria, API contracts
├── architecture/        # System blueprints, data flow diagrams, tech stack, migration boundary
├── design-system/       # Canonical visual & interaction implementation system (MASTER.md + page overrides)
├── decisions/           # Architecture Decision Records (ADRs) tracking technical choices
├── documentation/       # Developer onboarding, coding guidelines, and operational runbooks
├── src/                 # Idiomatic Next.js application source code
│   ├── app/             # Next.js App Router (pages, layouts, route groups, API endpoints)
│   ├── components/      # UI components (ui primitives, shared composite, feature modules)
│   ├── hooks/           # Custom client-side React hooks
│   ├── lib/             # Shared client singletons (db, auth) and runtime utilities (utils)
│   ├── server/          # Backend domain logic (Server Actions, services, repositories, validators)
│   ├── stores/          # Client-side global state stores
│   ├── styles/          # Design tokens, CSS variables, and global stylesheets
│   └── types/           # Shared application-level TypeScript definitions
├── public/              # Static assets directly served by Next.js at the root
├── prisma/              # ORM Schema & Client (Derived Schema & Introspection)
├── supabase/            # Database Migrations (Single Source of Truth), RLS, & Engine Config
├── security/            # Security governance, RLS policy specs, and RBAC matrix
├── testing/             # Testing pyramid (unit, integration, e2e, fixtures, mocks)
├── scripts/             # Database lifecycle automation scripts (db-reset.sh, db-sync.sh)
└── deployment/          # CI/CD workflows, Docker configs, environment templates, IaC
```

---

## ⚖️ Database Migration Ownership

To eliminate competing migrations, ordering deadlocks, and schema drift:
- **Supabase SQL** is the **single source of truth for all database migrations** (DDL, tables, columns, constraints, enums, indexes, extensions, RLS, triggers, functions, and seed data).
- **Prisma** is strictly the **ORM and type-safe query client layer**, utilizing `prisma db pull` to introspect the live database into `schema.prisma` and `prisma generate` to produce `@prisma/client`. Prisma never executes migrations.

See the comprehensive architecture specification in [`architecture/database-migration-boundary.md`](architecture/database-migration-boundary.md).
