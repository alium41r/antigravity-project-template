# Data Flow & Lifecycle

Document how data travels between the browser, edge runtime, Next.js server actions / route handlers, Prisma ORM, and Supabase PostgreSQL.

## Topics to Cover
- Read paths (Server Components direct database fetching, caching, revalidation).
- Write paths (Client forms -> Server Actions / API routes -> Validation -> Service layer -> Prisma mutations).
- Realtime events (Supabase postgres changes -> WebSocket subscriptions).
