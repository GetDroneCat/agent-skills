# Codex Hooks

This directory contains Codex hook scripts used by the installed `.codex` package.

## Files

- `session-start.sh`: loads `skills/using-agent-skills/SKILL.md` into session context.
- `simplify-ignore.sh`: block-protection helper for simplify-ignore annotations.
- `simplify-ignore-test.sh`: local test helper for `simplify-ignore.sh`.
- `SIMPLIFY-IGNORE.md`: usage and caveats for simplify-ignore.

## Codex setup

1. Enable hooks in `~/.codex/config.toml`:

```toml
[features]
experimental_use_hooks = true
```

2. Ensure project hook config exists at `.codex/hooks.json`.

This repo ships that file at `agent-skills-codex/hooks.json`, and `init.sh --tool codex` installs it to `<project>/.codex/hooks.json`.

## Notes

- `SessionStart` is the primary supported hook for these agent-skills integrations.
- `PreToolUse` and `PostToolUse` are currently Bash-tool focused in Codex, so file read/write interception behavior differs from Claude-style hooks.
