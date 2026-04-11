#!/usr/bin/env bash
# sync-skill.sh — copy prompt.md and install.sh from the repo root into skill/
# and auto-update skill/SKILL.md's version field to match the version header
# at the top of prompt.md. Single source of truth for the version is prompt.md.
#
# Run this before `clawhub publish ./skill`.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_DIR="$REPO_ROOT/skill"
PROMPT_FILE="$REPO_ROOT/prompt.md"
SKILL_MANIFEST="$SKILL_DIR/SKILL.md"

if [ ! -d "$SKILL_DIR" ]; then
  echo "Error: $SKILL_DIR does not exist" >&2
  exit 1
fi

if [ ! -f "$PROMPT_FILE" ]; then
  echo "Error: $PROMPT_FILE does not exist" >&2
  exit 1
fi

# Extract version from first line of prompt.md.
# Expected format: <!-- talk-normal X.Y.Z -->
VERSION=$(head -1 "$PROMPT_FILE" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)

if [ -z "$VERSION" ]; then
  echo "Error: could not extract version from first line of $PROMPT_FILE" >&2
  echo "  Expected a line like: <!-- talk-normal X.Y.Z -->" >&2
  exit 1
fi

# Copy the source files into skill/
cp "$PROMPT_FILE" "$SKILL_DIR/prompt.md"
cp "$REPO_ROOT/install.sh" "$SKILL_DIR/install.sh"
chmod +x "$SKILL_DIR/install.sh"

# Update skill/SKILL.md's version: field to match prompt.md
if [ -f "$SKILL_MANIFEST" ]; then
  sed -i.bak "s/^version: .*/version: $VERSION/" "$SKILL_MANIFEST"
  rm -f "${SKILL_MANIFEST}.bak"
else
  echo "Warning: $SKILL_MANIFEST not found, skipping version bump" >&2
fi

echo "Synced prompt.md and install.sh into $SKILL_DIR/"
echo "Bumped $SKILL_MANIFEST version field to $VERSION"
echo "Next: clawhub publish ./skill --slug talk-normal --version $VERSION --tags latest --changelog \"...\""
