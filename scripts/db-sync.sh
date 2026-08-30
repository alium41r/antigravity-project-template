#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# scripts/db-sync.sh
# Introspects the live database schema into prisma/schema.prisma and regenerates
# the typed Prisma Client. Run this immediately after applying any Supabase SQL
# migration (e.g. `npx supabase migration up`).
# -----------------------------------------------------------------------------

echo "📥 Introspecting database schema into prisma/schema.prisma..."
npx prisma db pull

echo "⚙️ Generating typed @prisma/client..."
npx prisma generate

echo "✅ Prisma schema and @prisma/client synchronized with database."
