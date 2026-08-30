# Technology Stack & Selection Rationale

This project template is built around a modern, high-velocity, type-safe fullstack stack:

## Core Technologies
- **Frontend Framework**: [Next.js](https://nextjs.org/) (App Router, Server Components, Client Components)
- **Language**: [TypeScript](https://www.typescriptlang.org/) for end-to-end type safety
- **Database ORM**: [Prisma](https://www.prisma.io/) for database schema introspection, type-safe queries, and client generation (Supabase SQL manages all migrations)
- **Backend & Database Platform**: [Supabase](https://supabase.com/) (PostgreSQL, Supabase Auth, Row-Level Security, Realtime, Storage)
- **Styling**: Modern CSS / Tailwind CSS with consistent design tokens
- **Validation**: [Zod](https://zod.dev/) for cross-boundary schema validation (forms, APIs, environment variables)
- **Testing**: [Vitest](https://vitest.dev/) (canonical default for unit and integration tests; Jest permitted only as an explicit project-level override documented in `brain.md` and backed by an ADR) and [Playwright](https://playwright.dev/) (End-to-End browser testing). See [`tooling-conventions.md`](tooling-conventions.md).
