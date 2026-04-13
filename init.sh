#!/bin/bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./init.sh --tool <codex|claude> --project /path/to/project [--force]

Options:
  --tool <name>      Tool to initialize. Supported: codex, claude.
  --project <path>   Target project directory.
  --force            Overwrite existing files.
  -h, --help         Show this help message.
USAGE
}

TOOL=""
PROJECT=""
FORCE=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --tool)
      TOOL="${2:-}"
      shift 2
      ;;
    --project)
      PROJECT="${2:-}"
      shift 2
      ;;
    --force)
      FORCE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ "$TOOL" != "codex" && "$TOOL" != "claude" ]]; then
  echo "Error: --tool must be one of: codex, claude." >&2
  exit 1
fi

if [[ -z "$PROJECT" ]]; then
  echo "Error: --project is required." >&2
  exit 1
fi

PROJECT="${PROJECT/#\~/$HOME}"
PROJECT="$(realpath -m "$PROJECT")"

if [[ ! -d "$PROJECT" ]]; then
  echo "Error: project path does not exist or is not a directory: $PROJECT" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# Select template source and destination root.
if [[ "$TOOL" == "codex" ]]; then
  SOURCE_ROOT="$SCRIPT_DIR/agent-skills-codex"
  if [[ ! -d "$SOURCE_ROOT" ]]; then
    echo "Error: no codex source directory found (agent-skills-codex)." >&2
    exit 1
  fi
  DEST_ROOT="$PROJECT/.codex"
  DISPLAY_ROOT=".codex"
elif [[ "$TOOL" == "claude" ]]; then
  SOURCE_ROOT="$SCRIPT_DIR/agent-skills-claude"
  if [[ ! -d "$SOURCE_ROOT" ]]; then
    echo "Error: no claude source directory found (agent-skills-claude)." >&2
    exit 1
  fi
  DEST_ROOT="$PROJECT"
  DISPLAY_ROOT="."
fi

mkdir -p "$DEST_ROOT"

copied=0
skipped=0
conflicted=0
declared=0

declare -a CONFLICT_PATHS

should_skip_rel() {
  local rel="$1"
  if [[ "$rel" == ".git" || "$rel" == .git/* || "$rel" == ".gitmodules" ]]; then
    return 0
  fi
  return 1
}

copy_node() {
  local src="$1"
  local dst="$2"
  local rel="$3"

  declared=$((declared + 1))

  # Create directories eagerly (except symlinked directories)
  if [[ -d "$src" && ! -L "$src" ]]; then
    mkdir -p "$dst"
    return
  fi

  if [[ -e "$dst" || -L "$dst" ]]; then
    if [[ "$FORCE" -eq 0 ]]; then
      skipped=$((skipped + 1))
      conflicted=$((conflicted + 1))
      CONFLICT_PATHS+=("$DISPLAY_ROOT/$rel")
      return
    fi
  fi

  mkdir -p "$(dirname "$dst")"
  cp -a "$src" "$dst"
  copied=$((copied + 1))
}

apply_source_tree() {
  local source="$1"
  while IFS= read -r -d '' rel; do
    if should_skip_rel "$rel"; then
      continue
    fi
    src="$source/$rel"
    dst="$DEST_ROOT/$rel"
    copy_node "$src" "$dst" "$rel"
  done < <(find "$source" -mindepth 1 -printf '%P\0' | sort -z)
}

# Apply main template tree.
apply_source_tree "$SOURCE_ROOT"

# Optional claude overrides: copied after base template so they can extend/override
# via --force or fill gaps under safe-merge mode.
if [[ "$TOOL" == "claude" ]]; then
  OVERLAY_ROOT="$SCRIPT_DIR/.claude-overrides"
  if [[ -d "$OVERLAY_ROOT" ]]; then
    apply_source_tree "$OVERLAY_ROOT"
  fi
fi

cat <<SUMMARY
$TOOL init summary
- Source: $SOURCE_ROOT
- Target: $DEST_ROOT
- Planned nodes: $declared
- Copied: $copied
- Skipped: $skipped
- Conflicts: $conflicted
- Overwrite: $( [[ "$FORCE" -eq 1 ]] && echo "force" || echo "safe-merge" )
SUMMARY

if [[ "$conflicted" -gt 0 ]]; then
  echo "Conflicting paths (first 50):"
  limit=0
  for p in "${CONFLICT_PATHS[@]}"; do
    echo "- $p"
    limit=$((limit + 1))
    [[ "$limit" -ge 50 ]] && break
  done
  if [[ "$FORCE" -eq 0 ]]; then
    echo "Tip: rerun with --force to overwrite existing files."
  fi
fi
