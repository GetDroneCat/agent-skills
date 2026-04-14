# simplify-ignore hook (Codex)

Block-level protection for simplify-ignore annotations.

## What works in Codex today

- This hook can run in Codex via `.codex/hooks.json` when hooks are enabled.
- Codex `PreToolUse`/`PostToolUse` hooks are currently Bash-tool focused, so Claude-style `Read`/`Edit`/`Write` interception is not guaranteed.
- Because of that, `simplify-ignore.sh` is best treated as an optional utility script in Codex projects.

## Setup

1. Annotate blocks you want to protect:

```js
/* simplify-ignore-start: perf-critical */
// manually unrolled XOR
result[0] = buf[0] ^ key[0];
result[1] = buf[1] ^ key[1];
result[2] = buf[2] ^ key[2];
result[3] = buf[3] ^ key[3];
/* simplify-ignore-end */
```

2. Enable hooks in `~/.codex/config.toml`:

```toml
[features]
experimental_use_hooks = true
```

3. If your runtime supports the needed hook events, wire `simplify-ignore.sh` from `.codex/hooks.json`.

## Manual recovery

If placeholders remain in files, run:

```bash
echo '{}' | bash .codex/hooks/simplify-ignore.sh
```

Backups are stored in `.codex/.simplify-ignore-cache/`.

## Requirements

- `jq`
- `shasum` or `sha1sum`
- Bash 3.2+
