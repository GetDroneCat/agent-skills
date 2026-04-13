# Agent Skills

Production-grade engineering skills and workflow templates for AI coding agents.

## Current Repository Structure

This repository is now organized as template packs:

```text
agent-skills/
├── agent-skills-codex/   # Codex package source
├── agent-skills-claude/  # Claude package source (submodule to upstream repository)
├── init.sh               # Installer for Codex config into a target project
├── CONTRIBUTING.md
├── README.md
└── LICENSE
```

## Codex Quick Start

Install the Codex package into any project:

```bash
./init.sh --tool codex --project ~/repo/<project-folder>
```

Optional flags:

- `--force`: overwrite existing files in `<project>/.codex`

Installation result:

- Copies this repo's Codex bundle into `<project>/.codex`
- Uses safe-merge by default (existing files are skipped and reported)

## Claude Quick Start

Install the Claude template into any project root:

```bash
./init.sh --tool claude --project ~/repo/<project-folder>
```

This copies the `agent-skills-claude/` contents into the target project root (for example: `.claude/`, `.claude-plugin/`, `AGENTS.md`, `CLAUDE.md`, `skills/`, `docs/`, `hooks/`, `references/`, `agents/`), with the same safe-merge/force behavior.

## What's Inside `agent-skills-codex`

```text
agent-skills-codex/
├── AGENTS.md
├── commands/
├── hooks/
├── plugins/
├── references/
├── skills/
└── subagents/
```

Notes:

- Skills that need checklists use per-skill `references/` symlinks pointing to `agent-skills-codex/references/`.
- Subagents are defined in TOML files under `agent-skills-codex/subagents/`.
- Command-equivalent prompt files are in `agent-skills-codex/commands/` (`spec`, `plan`, `build`, `test`, `review`, `code-simplify`, `ship`).

## Compatibility

- `agent-skills-codex/` is the primary Codex source path.
- `agent-skills-claude/` is the primary Claude source path.
- Installer supports `--tool codex` and `--tool claude`.

## Development Notes

- Keep `agent-skills-codex/` and `init.sh` in sync.
- Keep `agent-skills-claude/` and `init.sh` in sync.
- If you update skills/references/subagents/hooks, verify install behavior with:

```bash
./init.sh --tool codex --project /tmp/codex-smoke
./init.sh --tool claude --project /tmp/claude-smoke
./init.sh --tool codex --project /tmp/codex-smoke --force
./init.sh --tool claude --project /tmp/claude-smoke --force
```

## Attribution

Thanks to the original work and structure from the upstream project:

- https://github.com/addyosmani/agent-skills

## License

MIT
