#!/bin/bash
# agent-skills session start hook for Codex
# Injects the using-agent-skills meta-skill into session context.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$(dirname "$SCRIPT_DIR")/skills"
META_SKILL="$SKILLS_DIR/using-agent-skills/SKILL.md"

if [ -f "$META_SKILL" ]; then
  printf 'agent-skills loaded. Use the skill discovery flowchart to find the right skill for your task.\n\n'
  cat "$META_SKILL"
else
  printf 'agent-skills: using-agent-skills meta-skill not found. Skills may still be available individually.\n'
fi
