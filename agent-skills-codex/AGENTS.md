# AGENTS.md (Codex)

This file defines Codex project behavior for the installed project.

## Project Layout

- `.codex/skills/` - project skill library
- `.codex/references/` - canonical shared references used by skills
- `.codex/subagents/` - specialized subagent definitions
- `.codex/hooks/` - reusable hook scripts

## Skill Invocation Policy

- Always evaluate whether a task matches one or more skills.
- If a matching skill exists, follow that skill workflow.
- Do not skip required verification steps in a skill.

## Command Compatibility

- Preferred lifecycle command UX: `/rb-spec`, `/rb-plan`, `/rb-build`, `/rb-test`, `/rb-review`, `/rb-ship`, `/rb-refactor`.
- Portable fallback when slash parsing rejects custom names: `$rb-spec`, `$rb-plan`, `$rb-build`, `$rb-test`, `$rb-review`, `$rb-ship`, `$rb-refactor`.
- Keep native Codex built-ins available:
  - `/plan` (built-in planning mode)
  - `/review` (built-in working-tree review)

When users send `/rb-*`, interpret it as the matching `rb-*` wrapper skill. If the runtime rejects unknown slash commands, use the `$rb-*` form.

## Lifecycle Mapping

- DEFINE -> `spec-driven-development`
- PLAN -> `planning-and-task-breakdown`
- BUILD -> `incremental-implementation` + `test-driven-development`
- VERIFY -> `debugging-and-error-recovery`
- REVIEW -> `code-review-and-quality`
- SHIP -> `shipping-and-launch`
- REFACTOR -> `code-simplification`

`rb-*` wrapper mapping:
- `rb-spec` -> `spec-driven-development`
- `rb-plan` -> `planning-and-task-breakdown`
- `rb-build` -> `incremental-implementation` + `test-driven-development`
- `rb-test` -> `test-driven-development`
- `rb-review` -> `code-review-and-quality`
- `rb-ship` -> `shipping-and-launch`
- `rb-refactor` -> `code-simplification`

## Subagents

Use subagents from `.codex/subagents/` for focused review passes:

- `code-reviewer`
- `test-engineer`
- `security-auditor`

## Reference Locality Rule

Skills should use references from their local `references/` folder when present. Those files are symlinked to `.codex/references/` so each skill remains self-contained while keeping a single canonical source.
