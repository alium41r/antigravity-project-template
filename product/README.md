# Product Context (`product/`)

This directory captures high-level, human-readable product context, user personas, and user journeys to support product design, UI/UX architecture, and stakeholder discussions.

---

## 🏛️ Product Documentation Hierarchy & Source of Truth

To ensure deterministic decision-making, the relationship between product strategy and engineering specifications is strictly defined:

| Document Layer | Role & Authority | Description |
| :--- | :--- | :--- |
| **`brain.md`** | **Canonical Source of Truth** | Definitive project strategy, product identity, goals, non-goals, and stack assumptions. Governs all subordinate docs. |
| **`product/vision.md`** | **Derived Executive Summary** | High-level executive synthesis of product positioning and value proposition (strictly subordinate to `brain.md`). |
| **`product/personas/`** | **User Research & Profiles** | Detailed user, customer, and buyer persona profiles, pain points, motivations, and workflows. |
| **`product/journeys/`** | **User Journey Maps** | Step-by-step user journey maps, lifecycle stages, and key interaction diagrams across touchpoints. |
| **`specifications/features/`** | **Implementation Contracts** | Concrete, technical feature specifications, PRDs, input/output schemas, and acceptance criteria. |

---

## 🤖 AI Agent Reading Order

When planning, designing, or implementing any product feature, AI coding agents must read documents in this exact sequence:

1. **[`brain.md`](../brain.md)**: Read first to anchor understanding of core strategy, product scope, constraints, and active technical capabilities.
2. **[`product/vision.md`](vision.md)**: Read for an executive overview of the product's market direction and core narrative.
3. **[`product/personas/`](personas/)**: Read to understand the specific target persona, pain points, and user context.
4. **[`product/journeys/`](journeys/)**: Read to trace the end-to-end journey and user lifecycle states.
5. **[`specifications/features/`](../specifications/features/)**: Read immediately before authoring or modifying code to adhere to the strict implementation contract and acceptance criteria.

---

## 📂 Subdirectories & Files

- **[`vision.md`](vision.md)**: Concise executive product summary derived from `brain.md` (non-governing; for high-level reviews).
- **`personas/`**: Profiles of primary and secondary users, their pain points, workflows, and motivations.
- **`journeys/`**: End-to-end user journey maps, lifecycle stages, and key workflow diagrams.

---

## 💡 Guidelines

- When product direction shifts, update [`brain.md`](../brain.md) first, then update files in this directory to reflect the changes.
- Never introduce new strategic decisions, technical constraints, or architectural rules here without first recording them in `brain.md` or an ADR.
