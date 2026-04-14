# Contributing to Agent Skills

Thanks for contributing.

## Repository Model

This repo is template-driven:

- `agent-skills-codex/` is the Codex package source.
- `agent-skills-claude/` is the Claude package source.
- `init.sh` installs Codex or Claude config into target projects.

Current installer scope:

```bash
./init.sh --tool codex --project /path/to/project
./init.sh --tool claude --project /path/to/project
```

## What to Update

When making changes, update the relevant template content and keep installer behavior accurate.

Typical areas:

- `agent-skills-codex/*`
- `agent-skills-claude/*`
- `init.sh`

## Contribution Rules

- Keep changes focused and minimal.
- Preserve existing naming conventions and file layout.
- Ensure copied or linked files in `agent-skills-codex` remain valid.
- Keep `agent-skills-codex/commands/*` aligned with skill workflows.
- Keep `rb-*` wrapper skills aligned with canonical lifecycle skills:
  - `rb-spec` -> `spec-driven-development`
  - `rb-plan` -> `planning-and-task-breakdown`
  - `rb-build` -> `incremental-implementation` + `test-driven-development`
  - `rb-test` -> `test-driven-development`
  - `rb-review` -> `code-review-and-quality`
  - `rb-ship` -> `shipping-and-launch`
- Ensure `agent-skills-claude` remains installable at project root.
- Do not break safe-merge install behavior in `init.sh`.

## Validation Checklist

Before finishing a change:

1. Run installer apply mode:
   ```bash
   ./init.sh --tool codex --project /tmp/codex-check
   ```
2. Re-run apply mode and confirm conflict reporting works (safe merge).
3. Run with force and confirm overwrite path works:
   ```bash
   ./init.sh --tool codex --project /tmp/codex-check --force
   ```
4. Validate Claude install path:
   ```bash
   ./init.sh --tool claude --project /tmp/claude-check
   ./init.sh --tool claude --project /tmp/claude-check --force
   ```

## Reporting Issues

Open an issue for:

- Broken template links/symlinks
- Invalid subagent or skill packaging
- Installer regressions

## License

By contributing, you agree your contributions are licensed under MIT.

## Attribution

This repository structure and many skill workflows are based on the upstream project:

- https://github.com/addyosmani/agent-skills
