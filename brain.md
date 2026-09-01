# Project Brain: Strategic & Technical Knowledge Base

> **Instructions for the Project Owner & AI Agents**:
> This document is the canonical, persistent source of truth for the product's identity, strategy, constraints, and architecture.
> When initializing a new project from this template, fill out each section below.
> Derived documents (such as [`product/vision.md`](product/vision.md)) must remain strictly synchronized with this file; in any discrepancy, `brain.md` governs unconditionally.
> AI agents working on this project must consult this file before proposing or executing architectural changes.

---

## Project Metadata
- **Last Updated**: `[YYYY-MM-DD]`
- **Updated By**: `[Human Contributor / AI Agent Identifier]`
- **Current Phase**: `[Discovery | Prototyping | MVP Development | Alpha | Beta | Production]` *(Must mirror Section 12)*

---

## 0. Template Defaults vs. Project-Specific Decisions
This repository provides a production-grade fullstack baseline, but not all projects require all architectural layers:
- **Project Tier**: `[T1 Static Marketing | T2 Content / Editorial | T3 Public Interactive Tool | T4 E-Commerce Storefront | T5 Internal / Team App | T6 SaaS Platform] — [Description]` *(Recorded during initialization by the `project-initializer` skill. This field drives capability activation, SETUP step applicability, design-system depth, and the `vibe-security` audit scope.)*
- **Baseline Template Defaults**: Next.js (App Router), TypeScript, Prisma ORM, and Supabase (PostgreSQL, Auth, Storage).
- **Project-Specific Activation**: Each capability (database persistence, authentication, billing, email, realtime) is activated only if explicitly required by the project's scope.
- **Minimalism & Overrides**: For lightweight websites, public tools, or marketing sites that do not require user accounts or a database, unused template modules remain inactive without introducing dead complexity or forcing unwanted dependencies.
- **Architectural Record**: Any departure from the baseline defaults should be explicitly recorded in Section 15 below and backed by an ADR in `decisions/records/`.

---

## 1. Product Identity
- **Product Name**: `[Project Name]`
- **Tagline**: `[One-sentence pitch or tagline]`
- **Product Category**: `[e.g., B2B SaaS, Marketplace, Developer Tool, E-Commerce]`
- **Elevator Pitch**:
  > `[2-3 sentences explaining what the product is, for whom it is built, and why it matters.]`

---

## 2. Problem Statement
- **Core Problem**: `[Describe the primary problem or market friction being addressed.]`
- **Current Alternatives & Workarounds**: `[How do users solve this today? (Spreadsheets, manual labor, legacy software)]`
- **Why Current Solutions Fail**: `[What are the key limitations, inefficiencies, or costs of current alternatives?]`

---

## 3. Target Users
- **Primary Persona**:
  - **Role/Profile**: `[e.g., Operations Manager at mid-sized logistics firms]`
  - **Context**: `[Where and when do they experience the problem?]`
  - **Key Objectives**: `[What are they accountable for?]`
- **Secondary Persona**:
  - **Role/Profile**: `[e.g., End customer / Individual contributor]`
  - **Context**: `[Secondary user touchpoints]`
- **Anti-Personas**: `[Who is this product explicitly NOT built for?]`

---

## 4. User Needs & Jobs to Be Done (JTBD)
- **Core Jobs**:
  - *When I...* `[context]`
  - *I want to...* `[action]`
  - *So that I can...* `[expected outcome]`
- **Critical Pain Points to Relieve**:
  - `[Pain point 1]`
  - `[Pain point 2]`
- **Must-Have Outcomes**:
  - `[Measurable outcome 1]`
  - `[Measurable outcome 2]`

---

## 5. Value Proposition & Key Differentiators
- **Core Value Proposition**: `[Why choose this product over anything else?]`
- **Primary Differentiators (10x Factors)**:
  - `[Differentiator 1: e.g., Real-time collaborative engine vs static reporting]`
  - `[Differentiator 2: e.g., Automated AI reconciliation vs manual data entry]`
- **Unfair Advantages**: `[Proprietary data, network effects, distribution, domain expertise]`

---

## 6. Product Goals & Metrics
- **Near-Term Goals (MVP / Phase 1)**:
  - `[Goal 1: e.g., Onboard 10 beta teams with 80% weekly retention]`
  - `[Goal 2: e.g., Achieve < 200ms end-to-end processing latency]`
- **Key Performance Indicators (KPIs)**:
  - **North Star Metric**: `[e.g., Weekly Active Workflows Completed]`
  - **Secondary Metrics**: `[e.g., CAC, Time-to-First-Value, Churn Rate]`

---

## 7. Non-Goals (Explicitly Out of Scope)
- `[Feature / Capability A]: Explicitly deferred to Phase 2+`
- `[Market Segment B]: Not serving this market segment in V1`
- `[Technical Path C]: Not supporting legacy browsers or offline-first synchronization initially`

---

## 8. Business Model & Monetization
- **Revenue Model**: `[e.g., Subscription SaaS / Usage-based / Marketplace fee / Freemium]`
- **Pricing Tiers**:
  - **Free / Starter**: `[Scope of free tier]`
  - **Pro / Growth**: `[Features and price point]`
  - **Enterprise**: `[Custom SLA, SSO, dedicated support]`
- **Go-to-Market Strategy**: `[e.g., Product-Led Growth (PLG), direct outbound, community-driven]`

---

## 9. Brand & Design Direction
- **Brand Personality**: `[e.g., Modern, utilitarian, playful, high-trust, editorial]`
- **Design Archetype & Aesthetic**: `[e.g., Sleek dark-mode enterprise, clean minimalist glassmorphic, warm Scandinavian]`
- **Visual Principles**:
  - **Typography**: `[e.g., Inter / Outfit / Geist with crisp tabular numbers]`
  - **Color Palette**: `[e.g., Deep slate/zinc neutral base with single vibrant primary accent (Indigo / Emerald)]`
  - **Interaction Density**: `[e.g., Compact data-dense tables vs spacious consumer walkthrough]`
- **Design References**: `[List 2-3 benchmark products whose polish and UX match the desired standard]`
- **Design System**: The visual/interaction implementation system lives in [`design-system/MASTER.md`](design-system/MASTER.md) (canonical execution layer, generated by the `ui-ux-pro-max` skill), with route-specific overrides in `design-system/pages/`. This section defines brand *intent*; the design system defines *execution* and is strictly subordinate to this section.

---

## 10. Competitive Landscape
| Competitor | Strengths | Weaknesses | Our Strategic Advantage |
| :--- | :--- | :--- | :--- |
| `[Competitor A]` | `[Strength]` | `[Weakness]` | `[Our Counter]` |
| `[Competitor B]` | `[Strength]` | `[Weakness]` | `[Our Counter]` |

---

## 11. Important Constraints
- **Regulatory & Compliance**: `[e.g., GDPR, HIPAA, SOC 2 Type II readiness]`
- **Data Residency & Privacy**: `[e.g., EU-only data storage requirements]`
- **Performance Budgets**: `[e.g., First Contentful Paint < 1.0s, p95 API response < 150ms]`
- **Resource / Team Constraints**: `[e.g., Lean engineering team; must favor managed services]`

---

## 12. Current Project State
- **Current Phase**: `[Discovery | Prototyping | MVP Development | Alpha | Beta | Production]` *(Must match Project Metadata header)*
- **Active Focus**: `[Describe the primary objective of the current sprint or cycle]`
- **Recent Milestones Completed**:
  - `[Milestone 1]`
- **Immediate Next Steps**:
  - `[Next step 1]`
  - `[Next step 2]`

---

## 13. Long-Term Vision (North Star)
- **3-Year Trajectory**: `[Where does this product stand in the ecosystem in 3 years?]`
- **Platform Expansion Potential**: `[e.g., Marketplace of third-party integrations, developer API platform]`

---

## 14. Key Integrations (Optional / As Needed)
*Define which integrations are active for this specific project. Mark as "None" if unused.*
- **Authentication**: `[Optional: Supabase Auth (OAuth: Google/GitHub, Magic Links, Passkeys) — specify if user accounts/sessions are required, or "None (Public Application)"]`
- **Database & Storage**: `[Default: Supabase PostgreSQL + Supabase Storage — specify if persistence/uploads are needed, or "None (Static / Client-Only)"]`
- **Payments & Billing**: `[Optional: Stripe Billing / Customer Portal / Lemon Squeezy — or "None"]`
- **Email & Communications**: `[Optional: Resend / React Email / SendGrid — or "None"]`
- **Analytics & Observability**: `[Optional: PostHog / Sentry / OpenTelemetry — or "None"]`
- **Realtime / WebSockets**: `[Optional: Supabase Realtime / Pusher — or "None"]`
- **Rate Limiting & Abuse Controls**: `[Optional: Upstash Redis + @upstash/ratelimit / edge WAF / PostgreSQL counters — or "None"]`
- **AI / LLM Features**: `[Optional: OpenAI / Anthropic / Gemini SDK with per-user quotas and provider hard caps — or "None"]`

---

## 15. Key Technical Assumptions & Stack Decisions
- **Template Baseline**: Next.js App Router with TypeScript.
- **Relational Persistence**: Prisma ORM is the default relational data layer when structured database storage is required.
- **Database Engine & Platform**: Supabase PostgreSQL is the default engine when database, auth, or storage capabilities are required.
- **Project-Specific Overrides**:
  - `Database Required`: `[Yes / No — if No, Prisma & Supabase remain inactive]`
  - `Authentication Required`: `[Yes / No — if No, app operates in public mode without auth guards]`
  - `Rendering Strategy`: `[Server Components + SSR default / Static Export (SSG) / Client-Heavy]`
  - `Styling Choice`: `[Tailwind CSS with design tokens / CSS Modules]`
- **Client/Server Boundary**: Client mutations interact via type-safe Next.js Server Actions and validated Zod schemas when backend mutations exist.
