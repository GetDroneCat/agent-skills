# AGENTS.md (Codex)

This file defines Codex project behavior for the installed project.

## Project Layout

- `.codex/skills/` - project skill library
- `.codex/commands/` - reusable command-equivalent prompt snippets
- `.codex/references/` - canonical shared references used by skills
- `.codex/subagents/` - specialized subagent definitions
- `.codex/hooks/` - reusable hook scripts

## Skill Invocation Policy

- Always evaluate whether a task matches one or more skills.
- If a matching skill exists, follow that skill workflow.
- Do not skip required verification steps in a skill.

## Lifecycle Mapping

- DEFINE -> `spec-driven-development`
- PLAN -> `planning-and-task-breakdown`
- BUILD -> `incremental-implementation` + `test-driven-development`
- VERIFY -> `debugging-and-error-recovery`
- REVIEW -> `code-review-and-quality`
- SHIP -> `shipping-and-launch`

## Subagents

Use subagents from `.codex/subagents/` for focused review passes:

- `code-reviewer`
- `test-engineer`
- `security-auditor`

## Reference Locality Rule

Skills should use references from their local `references/` folder when present. Those files are symlinked to `.codex/references/` so each skill remains self-contained while keeping a single canonical source.
