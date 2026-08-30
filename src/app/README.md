# Next.js App Router (`src/app/`)

This directory is the idiomatic routing entry point for Next.js App Router.

## Recommended Route Groups
- **`(marketing)/`**: Public landing pages, pricing, about, terms, and blog (with marketing header/footer).
- **`(auth)/`**: Login, signup, password reset, and verify email pages (with focused auth layout).
- **`(dashboard)/`**: Protected application workspaces and user interfaces (with sidebar and app shell).
- **`api/`**: Next.js Route Handlers (`route.ts`) for standard REST endpoints, webhooks, and health checks.

## File Conventions
- `layout.tsx`: Root and nested route segment layouts.
- `page.tsx`: Route segment views.
- `loading.tsx`: Suspense fallback boundaries.
- `error.tsx`: Segment error boundaries (must be client component).
- `not-found.tsx`: 404 handler.
