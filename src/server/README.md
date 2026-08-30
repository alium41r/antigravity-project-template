# Server & Domain Layer (`src/server/`)

Contains server-only business logic, domain services, mutations, and data access layers.

## 📂 Subdirectories
- **`actions/`**: Next.js Server Actions (`"use server"`) processing form submissions and mutations.
- **`services/`**: Pure domain logic and use cases, isolated from transport protocols.
- **`repositories/`**: Data access abstraction layer bridging business services to Prisma and Supabase queries.
- **`validators/`**: Input validation schemas (Zod) for mutations, query parameters, and entities.
- **`integrations/`**: Third-party API clients and SDK wrappers (Stripe, Resend, S3, OpenAI).
