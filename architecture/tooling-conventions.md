# Tooling, Compiler & Code Quality Conventions

This document establishes the canonical standards for TypeScript configuration, path aliasing, testing infrastructure, code formatting, and linting across the project template.

---

## 1. TypeScript & Path Alias Conventions

### Canonical Path Alias
The repository enforces a single primary path alias pointing to the application source directory:
- **`@/*`** maps strictly to **`./src/*`**

```json
// tsconfig.json (canonical reference)
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```

### Path Resolution Rules
1. **Never use deep relative climbing**: Do not use `../../../../` when crossing domain or architectural layers. Use `@/components/...`, `@/lib/...`, `@/server/...`.
2. **Local intra-module imports**: Relative imports (e.g. `./button`, `./types`) are permitted only between sibling files within the same immediate directory component.
3. **Boundary isolation**: Never import from `@/server/*` or `@/lib/db/*` into client components or client hooks.

---

## 2. Next.js & Compiler Conventions

### Core TypeScript Settings
- **Strict Mode**: `"strict": true` is non-negotiable. No implicit `any`, no unchecked indexed access where avoidable.
- **Module Resolution**: `"moduleResolution": "bundler"` (standard for Next.js App Router and modern bundlers).
- **Target & Library**: Modern ECMAScript (`"target": "ES2022"`, `"lib": ["dom", "dom.iterable", "esnext"]`).
- **JSX Transform**: `"jsx": "preserve"` (delegated to the Next.js SWC compiler).

### Next.js Configuration (`next.config.ts`)
- Use TypeScript for the configuration entry point (`next.config.ts`).
- Keep security headers (CSP, HSTS, X-Frame-Options) declared in `next.config.ts` or edge proxy (`src/proxy.ts`).
- Server-only modules must be protected against accidental client bundling via Next.js package boundaries or the `server-only` package.

### Lint Script (Next.js 16+)
- Next.js 16 removed `next lint`. The canonical package script is:
  ```json
  "lint": "eslint ."
  ```
- ESLint uses flat config (`eslint.config.mjs`) with `eslint-config-next` — see §4.

---

## 3. Testing Infrastructure

### Canonical Test Runner: Vitest
- **Default Runner**: **Vitest** is the canonical unit and integration test runner for this template.
  - **Rationale**: Native ESM support, seamless TypeScript compilation without Babel or ts-jest overhead, instant HMR in watch mode, and high performance with modern bundler tooling.
  - **Jest Policy**: Jest is supported **only** as an explicit project-level override (documented in `brain.md` §15 with a corresponding ADR in `decisions/records/`). It must not be installed alongside Vitest.

### Test Directory Topology (`testing/`)
Tests are centralized in the root `testing/` directory outside `src/` to maintain a clean application distribution boundary:
- **`testing/unit/`**: Isolated unit tests for pure domain functions, services, calculations, and utility helpers (`*.test.ts`).
- **`testing/integration/`**: Integration tests verifying database repositories, Server Actions, and API Route Handlers (`*.test.ts`).
- **`testing/e2e/`**: Browser automation and user journey tests executed via **Playwright** (`*.spec.ts`).
- **`testing/fixtures/`**: Static mock payloads, database seeds, and test factories.
- **`testing/mocks/`**: Network interception handlers (e.g., Mock Service Worker / MSW), mock Supabase auth sessions, and Prisma client mocks.

### How Tests Must Import Application Code
Because `testing/` resides outside `src/`, all test files must resolve application modules via the `@/*` path alias:

```typescript
// testing/unit/services/example.test.ts
import { calculateMetric } from '@/server/services/analytics';
import { prisma } from '@/lib/db/prisma';
import type { UserProfile } from '@/types';
```

- **Configuration Requirement**: In `vitest.config.ts`, alias resolution must mirror `tsconfig.json`:
  ```typescript
  import { defineConfig } from 'vitest/config';
  import react from '@vitejs/plugin-react';
  import path from 'path';

  export default defineConfig({
    plugins: [react()], // Required when tests import .tsx components (T3–T6)
    resolve: {
      alias: {
        '@': path.resolve(__dirname, './src'),
      },
    },
    test: {
      environment: 'jsdom', // Component/hook tests need DOM; pure-node tests opt out per-file
      globals: true,
      include: ['testing/**/*.{test,spec}.{ts,tsx}'],
    },
  });
  ```
  - For T1–T2 projects without component tests, `environment: 'node'` and no React plugin are acceptable.
  - Pure-logic test files may opt out of jsdom with `// @vitest-environment node` at the top.
- **Rule**: Never import via fragile relative traversal such as `../../src/server/...`. Always use `@/...`.

### End-to-End Testing (Playwright, T4–T6)
- **Provisioning**: `@playwright/test` is installed only for projects with critical multi-step flows (e-commerce checkout, SaaS onboarding, auth). T1–T3 projects skip it.
- **Configuration**: Root `playwright.config.ts` points `testDir` at `testing/e2e/`:
  ```typescript
  import { defineConfig } from '@playwright/test';

  export default defineConfig({
    testDir: './testing/e2e',
    use: { baseURL: 'http://localhost:3000' },
    webServer: {
      command: 'npm run dev',
      url: 'http://localhost:3000',
      reuseExistingServer: true,
    },
  });
  ```
- **Browser binaries**: run `npx playwright install` once locally (`npx playwright install --with-deps` on CI images). Package script: `"test:e2e": "playwright test"`.

---

## 4. Linting & Formatting Standards

### Code Formatting: Prettier
- **Location**: Root configuration file `.prettierrc` (or `prettier.config.mjs`).
- **Rule**: Formatting is entirely delegated to Prettier to eliminate subjective style disputes.
- **Plugins**: `@ianvs/prettier-plugin-sort-imports` and `prettier-plugin-tailwindcss` (when Tailwind CSS is active).

### Static Analysis: ESLint (Flat Config)
- **Location**: Root configuration file `eslint.config.mjs`.
- **Base Configurations**:
  - `eslint-config-next/core-web-vitals`
  - `@typescript-eslint/recommended-type-checked`
- **Custom Guardrails**:
  - Prevent importing server-only code (`@/server/*`, `@/lib/db/*`) inside client component directories.
  - Ban `console.log` in production builds.

### Editor Consistency: EditorConfig
- **Location**: Root `.editorconfig` setting `indent_style = space`, `indent_size = 2`, `end_of_line = lf`, and `trim_trailing_whitespace = true`.
