#!/usr/bin/env bash
# Compatibility entry point; the Hermes installer also runs directly on Windows.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
exec python3 "$SCRIPT_DIR/scripts/install.py" "$@"
