---
name: talk-normal
description: Install concise writing rules for Hermes sessions.
version: 0.6.2
author: hexiecs
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [prompt, anti-slop, concise, system-prompt, chinese, bilingual, always-on]
    related_skills: []
---

# Talk Normal Skill

Install the English and Chinese writing rules from `prompt.md` into a Hermes
context file. This setup skill makes a persistent change that takes effect in
new sessions until its marked block is removed.

## When to Use

Use when the user asks to install, update, or remove persistent talk-normal
writing rules. Resolve the intended scope from the user's request: a project
workspace, an exact context file, or the active Hermes profile globally.

## Prerequisites

- Python 3.8+ through `terminal`; use `python` on Windows if needed.
- Write access to the selected context file.
- For profile-wide installation, use the active profile's `HERMES_HOME`.

## How to Run

Use `terminal` to run the bundled helper by its absolute skill path. Keep the
project workspace explicit so the result is independent of the terminal's CWD.

```text
python3 "${HERMES_SKILL_DIR}/scripts/install.py" --workspace "/absolute/project/path" --dry-run
python3 "${HERMES_SKILL_DIR}/scripts/install.py" --workspace "/absolute/project/path"
```

Read the preview's `Target:` line and diff before applying the requested change.
For global scope, use `--global` with the active profile's `HERMES_HOME` available
to `terminal`. The default Hermes home is `~/.hermes`.

## Quick Reference

| Option | Effect |
| --- | --- |
| `--workspace PATH` | Discover a project context file inside its Git boundary. |
| `--global` | Install in `HERMES_HOME/SOUL.md`. |
| `--target FILE` | Install in the exact selected file. |
| `--dry-run` | Print the resolved target and proposed diff. |
| `--uninstall` | Remove the marked block using the same scope as installation. |

The three scope options are mutually exclusive. Direct CLI use defaults to the
current workspace. The Bash `install.sh` entry point accepts the same options.

## Procedure

1. Resolve the user's requested scope and run a dry preview with `terminal`.
2. Apply that same command with `--dry-run` removed.
3. Inspect the printed target with `read_file` and verify one complete block.
4. Start a new Hermes session so the updated context is loaded.

Project discovery checks the nearest `.hermes.md` or `HERMES.md` up to the Git
root first, then the nearest `AGENTS.override.md`, `AGENTS.md`, or `agents.md`.
Existing workspace `CLAUDE.md`, `claude.md`, and `.cursorrules` are fallbacks.
A fresh project gets `AGENTS.md` at its Git root; outside Git, discovery stays
inside the selected directory. Global installation uses the profile's `SOUL.md`.

## Pitfalls

- The helper writes persistent instructions. Review `SKILL.md`, `prompt.md`, and
  `scripts/install.py` before installing. If Hermes blocks the skill's security
  scan, inspect the findings and use its documented override only after review.
- A `~/AGENTS.md` applies to workspaces where Hermes discovers it. Profile-wide
  writing preferences belong in `HERMES_HOME/SOUL.md`.
- Installing a skill bundle and applying its persistent writing rules are two
  separate steps. Use the actual skill directory reported by `skill_view`.
- For removal, reuse the exact target printed during installation, for example
  `--target "/absolute/project/AGENTS.md" --uninstall`.
- Damaged or duplicate markers produce an error before any file is written.

## Verification

Use `read_file` on the printed target to verify the block between
`# --- talk-normal BEGIN ---` and `# --- talk-normal END ---`, with surrounding
instructions preserved. Repeating the command should report `Already up to date.`
Ask a simple question in a new Hermes session to check the writing style.

Offline regression tests from the source checkout:

```text
python3 -m unittest discover -s tests -p 'test_hermes_install.py' -v
```
