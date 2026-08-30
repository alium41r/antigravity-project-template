# Shared Utilities (`src/lib/utils/`)

**Owner**: General-purpose, framework-agnostic helper functions and computation utilities.

---

## 📂 Scope & Permitted Utilities

This directory contains pure, reusable helper functions that have no dependencies on Next.js server runtime, database connections, or application business domain models:

- **Formatting**: Currency formatting, number separators, text truncation, name capitalization (`formatCurrency`, `truncateText`).
- **Parsing**: String sanitization, slug generation, CSV/JSON parsers.
- **Date & Time Helpers**: ISO timestamp conversions, relative time formatters, timezone-agnostic date manipulation.
- **URL & Query Helpers**: Query string builders, safe redirect URL checkers, path sanitizers.
- **Mathematical & Computation Utilities**: Percentage calculations, rounding functions, array chunking/deduplication.

---

## 🚫 Architectural Boundary & Rules

1. **No Domain Business Logic**: Do not place business models, payment rules, user permissions, or domain entities here. Domain logic belongs strictly in `src/server/services/`.
2. **No Data Access or Client Singletons**: Do not perform database queries, Supabase calls, or API requests from utility functions. Data access belongs in `src/server/repositories/`.
3. **Pure Functions Preferred**: Utility functions should ideally be pure (deterministic output for given inputs, free of side effects) to maximize unit testability in `testing/unit/`.
