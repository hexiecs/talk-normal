#!/usr/bin/env python3
"""Install talk-normal into an explicitly scoped Hermes context file."""

import argparse
import difflib
import os
from pathlib import Path
import re
import stat
import sys
import tempfile


BEGIN = "# --- talk-normal BEGIN ---"
END = "# --- talk-normal END ---"
PROMPT = Path(__file__).resolve().parents[1] / "prompt.md"


def project_target(workspace):
    """Search only the workspace's Git boundary, or the workspace itself."""
    workspace = workspace.expanduser().resolve()
    if not workspace.is_dir():
        raise ValueError("Workspace must be an existing directory: {}".format(workspace))
    ancestors = [workspace, *workspace.parents]
    root = next((p for p in ancestors if (p / ".git").exists()), None)
    directories = ancestors[:ancestors.index(root) + 1] if root else [workspace]
    # Hermes-specific files override the entire AGENTS.md directory chain.
    for directory in directories:
        for name in (".hermes.md", "HERMES.md"):
            candidate = directory / name
            if candidate.is_file():
                if candidate.read_bytes().decode("utf-8").strip():
                    return candidate
                # Hermes finds only the nearest Hermes-specific file. An empty
                # one falls through to the AGENTS chain, not another ancestor.
                break
        else:
            continue
        break
    for directory in directories:
        for name in ("AGENTS.override.md", "AGENTS.md", "agents.md"):
            candidate = directory / name
            if candidate.is_file() and candidate.read_bytes().decode("utf-8").strip():
                return candidate
    for name in ("CLAUDE.md", "claude.md", ".cursorrules"):
        candidate = workspace / name
        if candidate.is_file() and candidate.read_bytes().decode("utf-8").strip():
            return candidate
    return (root or workspace) / "AGENTS.md"


def update_content(original, prompt, uninstall=False):
    """Preserve surrounding bytes and reject ambiguous or damaged markers."""
    begins = list(re.finditer(r"(?m)^" + re.escape(BEGIN) + r"\r?$", original))
    ends = list(re.finditer(r"(?m)^" + re.escape(END) + r"\r?$", original))
    if begins or ends:
        if len(begins) != 1 or len(ends) != 1 or begins[0].end() >= ends[0].start():
            raise ValueError("Malformed or duplicate talk-normal markers; repair them before retrying.")
        start, stop = begins[0].start(), ends[0].end()
        if original[stop:stop + 1] == "\n":
            stop += 1
    else:
        start = stop = len(original)
    if uninstall:
        return original[:start] + original[stop:]
    newline = "\r\n" if "\r\n" in original else "\n"
    rules = prompt.replace("\r\n", "\n").rstrip("\n").replace("\n", newline)
    block = BEGIN + newline + rules + newline + END + newline
    if not begins and original and not original.endswith("\n"):
        block = newline + block
    return original[:start] + block + original[stop:]


def atomic_write(target, content):
    """Replace the file only after writing its complete replacement."""
    mode = stat.S_IMODE(target.stat().st_mode) if target.exists() else 0o600
    target.parent.mkdir(parents=True, exist_ok=True)
    temporary = None
    try:
        with tempfile.NamedTemporaryFile(dir=target.parent, prefix=".talk-normal-", delete=False) as handle:
            temporary = Path(handle.name)
            handle.write(content.encode("utf-8"))
            handle.flush()
            os.fsync(handle.fileno())
        temporary.chmod(mode)
        os.replace(str(temporary), str(target))
    finally:
        if temporary is not None and temporary.exists():
            temporary.unlink()


def main(argv=None):
    # Windows redirects default to the local code page, while the shared rules
    # contain Chinese. Emit UTF-8 for both the preview and Unicode target paths.
    for stream in (sys.stdout, sys.stderr):
        if hasattr(stream, "reconfigure"):
            stream.reconfigure(encoding="utf-8")
    parser = argparse.ArgumentParser(description=__doc__)
    scope = parser.add_mutually_exclusive_group()
    scope.add_argument("--workspace", type=Path, help="Project directory (default: current directory).")
    scope.add_argument("--global", dest="global_scope", action="store_true",
                       help="Use SOUL.md in HERMES_HOME (default: ~/.hermes).")
    scope.add_argument("--target", type=Path, help="Use this exact context file, including for removal.")
    parser.add_argument("--uninstall", action="store_true", help="Remove the marked block.")
    parser.add_argument("--dry-run", action="store_true", help="Show the target and diff without writing.")
    args = parser.parse_args(argv)
    try:
        if args.target is not None:
            target = args.target.expanduser()
        elif args.global_scope:
            home = os.environ.get("HERMES_HOME") or str(Path.home() / ".hermes")
            target = Path(home).expanduser() / "SOUL.md"
        else:
            target = project_target(args.workspace or Path.cwd())
        # Resolve an existing symlink so atomic replacement preserves the link.
        target = target.resolve()
        original = target.read_bytes().decode("utf-8") if target.exists() else ""
        prompt = "" if args.uninstall else PROMPT.read_bytes().decode("utf-8")
        updated = update_content(original, prompt, args.uninstall)
        print("Target: {}".format(target))
        if updated == original:
            print("Already up to date." if not args.uninstall else "talk-normal block is absent.")
        elif args.dry_run:
            sys.stdout.writelines(difflib.unified_diff(original.splitlines(True), updated.splitlines(True),
                                                     fromfile=str(target), tofile=str(target)))
        else:
            atomic_write(target, updated)
            print("Uninstalled talk-normal." if args.uninstall else "Installed talk-normal.")
            print("Start a new Hermes session to take effect.")
        return 0
    except (OSError, UnicodeError, ValueError) as error:
        print("Error: {}".format(error), file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
