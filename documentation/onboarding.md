# Developer Onboarding Guide

## Prerequisites
- Node.js (Active LTS)
- Package Manager (pnpm / npm / yarn)
- Docker Desktop (for local Supabase and Postgres)
- Supabase CLI
- Git

> **Instantiating a New Project?**  
> If you are an AI agent or developer creating a new project from this template, follow the complete protocol in [`SETUP.md`](../SETUP.md).

## Step-by-Step Local Setup
1. Clone the repository.
2. Copy environment variables:
   ```bash
   cp .env.example .env.local
   ```
3. Install dependencies (when project is initialized):
   ```bash
   npm install
   ```
4. Start local database & run migrations.
5. Launch development server:
   ```bash
   npm run dev
   ```
