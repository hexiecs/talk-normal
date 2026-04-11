#!/usr/bin/env bash
# talk-normal installer
# Usage: bash install.sh [--uninstall]
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROMPT_FILE="$SCRIPT_DIR/prompt.md"
MARKER_BEGIN="# --- talk-normal BEGIN ---"
MARKER_END="# --- talk-normal END ---"

# Extract version from the first line of prompt.md.
# Expected format: <!-- talk-normal X.Y.Z -->
# Falls back to empty string if not present.
extract_version() {
  [ -f "$PROMPT_FILE" ] || { echo ""; return; }
  head -1 "$PROMPT_FILE" 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1
}

# Resolve a path to its absolute form in a portable way
# (macOS bash lacks GNU readlink -f, so use cd + pwd).
abs_path() {
  local p="$1"
  local dir
  local base
  dir=$(dirname "$p")
  base=$(basename "$p")
  if [ -d "$dir" ]; then
    echo "$(cd "$dir" && pwd -P)/$base"
  else
    echo "$p"
  fi
}

# Detect OpenClaw workspace
find_agents_md() {
  # Check common locations
  for dir in "." "$HOME" "${OPENCLAW_WORKSPACE:-}"; do
    [ -z "$dir" ] && continue
    [ -f "$dir/AGENTS.md" ] && echo "$dir/AGENTS.md" && return
  done
  echo ""
}

uninstall() {
  local agents_md
  local agents_md_abs
  agents_md=$(find_agents_md)
  if [ -z "$agents_md" ]; then
    echo "No AGENTS.md found. Nothing to uninstall."
    exit 0
  fi

  agents_md_abs=$(abs_path "$agents_md")

  if grep -q "$MARKER_BEGIN" "$agents_md" 2>/dev/null; then
    # Remove the block between markers
    sed -i.bak "/$MARKER_BEGIN/,/$MARKER_END/d" "$agents_md"
    rm -f "${agents_md}.bak"
    echo "Uninstalled talk-normal from $agents_md_abs"
  else
    echo "talk-normal not found in $agents_md_abs"
  fi
}

install() {
  if [ ! -f "$PROMPT_FILE" ]; then
    echo "Error: prompt.md not found at $PROMPT_FILE"
    exit 1
  fi

  local agents_md
  local agents_md_abs
  local action="Installed"
  local version
  local version_label
  agents_md=$(find_agents_md)
  version=$(extract_version)

  # If no AGENTS.md found, create one in current directory
  if [ -z "$agents_md" ]; then
    agents_md="./AGENTS.md"
    echo "No AGENTS.md found. Creating $agents_md"
  fi

  agents_md_abs=$(abs_path "$agents_md")

  # If already installed, strip the old block first so re-running this script
  # performs an in-place update. This makes install.sh idempotent: the first
  # run installs, every subsequent run upgrades to the latest rules.
  if grep -q "$MARKER_BEGIN" "$agents_md" 2>/dev/null; then
    sed -i.bak "/$MARKER_BEGIN/,/$MARKER_END/d" "$agents_md"
    rm -f "${agents_md}.bak"
    action="Updated"
  fi

  # Append prompt with markers
  {
    echo ""
    echo "$MARKER_BEGIN"
    cat "$PROMPT_FILE"
    echo "$MARKER_END"
  } >> "$agents_md"

  if [ -n "$version" ]; then
    version_label=" v$version"
  else
    version_label=""
  fi
  echo "$action talk-normal$version_label in $agents_md_abs"
  echo "  source prompt.md: $PROMPT_FILE"
  echo "Start a new conversation to take effect."
}

if [ "${1:-}" = "--uninstall" ]; then
  uninstall
else
  install
fi
