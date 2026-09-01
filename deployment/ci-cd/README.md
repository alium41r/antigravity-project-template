# CI/CD Workflows

Continuous Integration & Continuous Deployment workflows.
- Pull Request verification (Linting, TypeScript check, Unit tests, E2E tests).
- Automated preview deployments.
- Production deployments to Vercel and Supabase migration execution.

## Security Release Gate
Before any first production deployment (and before major security-relevant changes), run the full audit of the global **`vibe-security`** skill (scoped to `brain.md` §0 tier and §14 active integrations) and confirm zero Critical/High findings are outstanding.
