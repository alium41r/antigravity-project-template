#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# scripts/db-reset.sh
# Safely resets the local Supabase PostgreSQL database, replays all SQL
# migrations in chronological order, executes seed.sql, introspects the
# resulting schema into Prisma, and regenerates the typed Prisma Client.
# -----------------------------------------------------------------------------

echo "🔄 Resetting local Supabase database and applying all migrations..."
npx supabase db reset

echo "📥 Introspecting database schema into prisma/schema.prisma..."
npx prisma db pull

echo "⚙️ Generating typed @prisma/client..."
npx prisma generate

echo "✅ Database reset, seed, schema introspection, and client generation complete."
