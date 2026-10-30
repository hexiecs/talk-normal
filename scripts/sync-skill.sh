#!/usr/bin/env bash
# sync-skill.sh — copy prompt.md into both bundles and install.sh into skill/,
# preserving the Hermes-specific installer. Update each SKILL.md to match the
# version header at the top of prompt.md. Single source of truth for the
# version is prompt.md.
#
# Run this before `clawhub publish ./skill`.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_DIR="$REPO_ROOT/skill"
HERMES_DIR="$REPO_ROOT/skill-hermes"
PROMPT_FILE="$REPO_ROOT/prompt.md"
SKILL_MANIFEST="$SKILL_DIR/SKILL.md"
HERMES_MANIFEST="$HERMES_DIR/SKILL.md"

if [ ! -d "$SKILL_DIR" ]; then
  echo "Error: $SKILL_DIR does not exist" >&2
  exit 1
fi

if [ ! -d "$HERMES_DIR" ]; then
  echo "Error: $HERMES_DIR does not exist" >&2
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

# Both bundles share the rules; each keeps its own platform integration.
for dest in "$SKILL_DIR" "$HERMES_DIR"; do
  cp "$PROMPT_FILE" "$dest/prompt.md"
done
cp "$REPO_ROOT/install.sh" "$SKILL_DIR/install.sh"
chmod +x "$SKILL_DIR/install.sh" "$HERMES_DIR/install.sh"

# Update SKILL.md version: field in both bundles
for manifest in "$SKILL_MANIFEST" "$HERMES_MANIFEST"; do
  if [ -f "$manifest" ]; then
    sed -i.bak "s/^version: .*/version: $VERSION/" "$manifest"
    rm -f "${manifest}.bak"
  else
    echo "Warning: $manifest not found, skipping version bump" >&2
  fi
done

echo "Synced prompt.md into both bundles and the OpenClaw installer into $SKILL_DIR/"
echo "Bumped SKILL.md version fields to $VERSION"

# Soft reminder: if prompt.md has any commits newer than the most recent
# CHANGELOG.md commit, the user probably forgot to update CHANGELOG before
# publishing. Non-blocking — just a warning, not a gate.
if git -C "$REPO_ROOT" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  CHANGELOG_LAST=$(git -C "$REPO_ROOT" log -1 --format=%H -- CHANGELOG.md 2>/dev/null || true)
  if [ -n "$CHANGELOG_LAST" ]; then
    UNLOGGED=$(git -C "$REPO_ROOT" log "${CHANGELOG_LAST}..HEAD" --oneline -- prompt.md 2>/dev/null | wc -l | tr -d ' ')
    if [ "${UNLOGGED:-0}" -gt 0 ]; then
      echo ""
      echo "⚠ Reminder: prompt.md has $UNLOGGED commit(s) newer than the last CHANGELOG.md entry."
      echo "  Consider adding a bullet for v$VERSION to CHANGELOG.md before publishing to ClawHub."
      echo ""
    fi
  fi
fi

echo "Next:"
echo "  ClawHub: clawhub publish ./skill --slug talk-normal --version $VERSION --tags latest --changelog \"...\""
echo "  Hermes:  hermes skills publish ./skill-hermes (or users install directly from GitHub)"
