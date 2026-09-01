# Testing Suite

Comprehensive testing infrastructure covering unit tests, integration tests, end-to-end tests, fixtures, and mocks.

---

## 📂 Subdirectories
- **`unit/`**: Unit tests for isolated pure functions, domain services, utility helpers (`src/lib/utils/`), and hooks.
- **`integration/`**: Integration tests verifying database queries, service interactions, Server Actions, and API routes.
- **`e2e/`**: Browser-driven end-to-end user journey tests (Playwright).
- **`fixtures/`**: Test data factories, static mock payloads, and test fixtures.
- **`mocks/`**: Mock handlers (e.g. Mock Service Worker / MSW), mock Supabase auth sessions, and Prisma mocks.

---

## 📐 Conventions & Rules
- **Canonical Default**: **Vitest** is the canonical default runner for unit and integration tests; **Playwright** is the canonical runner for E2E tests (provisioned for T4–T6 projects via `@playwright/test` with a root `playwright.config.ts` pointing at `testing/e2e/`).
- **Jest Policy**: Jest is supported *only* as an explicit project-level override (documented in `brain.md` §15 and backed by an ADR). Jest must never be installed alongside Vitest by default.
- **Imports**: Test files must import application modules using the `@/*` path alias (`@/server/...`, `@/lib/...`). Never use fragile relative directory traversal.
- See [`architecture/tooling-conventions.md`](../architecture/tooling-conventions.md) and [`project_constitution.md`](../project_constitution.md) Article X for full specifications.
