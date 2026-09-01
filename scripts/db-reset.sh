#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# scripts/db-reset.sh [--force]
# Safely resets the local Supabase PostgreSQL database, replays all SQL
# migrations in chronological order, executes seed.sql, introspects the
# resulting schema into Prisma, and regenerates the typed Prisma Client.
#
# DESTRUCTIVE (local only): `supabase db reset` drops the local database
# schema. Interactive confirmation is required unless --force is passed
# (use --force only in CI with disposable databases).
# -----------------------------------------------------------------------------

if [[ "${1:-}" != "--force" ]]; then
  echo "⚠️  This will DROP the local Supabase database schema and replay all migrations + seed.sql."
  read -r -p "Continue? (type 'yes' to proceed): " confirm
  if [[ "$confirm" != "yes" ]]; then
    echo "❌ Aborted. No changes were made."
    exit 1
  fi
fi

echo "🔄 Resetting local Supabase database and applying all migrations..."
npx supabase db reset

echo "📥 Introspecting database schema into prisma/schema.prisma..."
npx prisma db pull

echo "⚙️ Generating typed @prisma/client..."
npx prisma generate

echo "✅ Database reset, seed, schema introspection, and client generation complete."
