# Architecture Decision Records (ADRs)

We document significant architectural decisions in this directory using lightweight, immutable records.

## Structure
- **`templates/adr-template.md`**: Standard template for drafting new ADRs.
- **`records/`**: Chronologically numbered decisions (`0001-record-architecture-decisions.md`, etc.).

## When to write an ADR?
- Choosing or replacing a fundamental library or framework.
- Introducing a new data access pattern or state management model.
- Defining authentication, security, or data isolation strategies.

## Precedence & Authority
Per [`project_constitution.md`](../project_constitution.md):
- ADRs capture the historical context and rationale of why choices were made at specific points in time.
- An ADR **never overrides** a newer documented decision or convention in `brain.md` or `architecture/`.
- If an architectural pattern evolves, create a new ADR that explicitly marks the prior record as `Superseded`.
