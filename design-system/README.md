# Design System (`design-system/`)

> [!IMPORTANT]
> **Canonical visual & interaction implementation system — strictly subordinate to `brain.md` §9.**
> `brain.md` §9 defines brand *intent* (personality, archetype, typography direction, palette direction, density, references). This directory defines visual *execution*: concrete tokens, typography scale, spacing, component patterns, and anti-patterns.

## 📂 Structure

- **`MASTER.md`** — The global source of truth for the design system: palette, CSS/Tailwind tokens, typography, baseline spacing, component patterns, state handling (loading/empty/error), and anti-patterns.
- **`pages/<page-name>.md`** — Route-specific visual overrides (e.g. high-density data tables for `/dashboard` vs. a spacious hero for `/landing`). When a page override exists, it governs that route over `MASTER.md`.

## 🔁 Generation & Retrieval

- Generated and updated by the global **`ui-ux-pro-max`** skill (`--design-system --persist --output-dir <project-root>`). The engine persists to `design-system/MASTER.md` (slug-less — one repository holds one project).
- **Retrieval rule**: before authoring or modifying UI code, read `design-system/pages/<page-name>.md` if it exists (it overrides `MASTER.md` for that route); otherwise `MASTER.md` governs exclusively.
- Existing tokens are preserved: persistence skips an existing `MASTER.md` unless `--force` is passed.

## ⚖️ Authority

Per `project_constitution.md` (Document Precedence): this directory is subordinate to `project_constitution.md`, `brain.md`, `architecture/`, `security/`, and `specifications/`. When brand intent (`brain.md` §9) and this system diverge, `brain.md` governs and the design system must be regenerated or updated to align.
