---
name: talk-normal
description: Stop LLM slop. A curated system prompt that cuts verbose, corporate-sounding LLM output by 56-73% (measured) while preserving information. Works bilingually (English + Chinese). Installs into your AGENTS.md as an always-on behavior modifier.
version: 0.6.2
author: hexiecs
license: MIT
metadata:
  hermes:
    tags: [prompt, anti-slop, concise, system-prompt, chinese, bilingual, always-on]
    related_skills: []
---

# talk-normal

A curated system prompt that stops your LLM from writing like a LinkedIn post. Measured: 73% character reduction on GPT-4o-mini, 72% on GPT-5.4, across 10 prompts in English and Chinese, without losing information.

## When to Use

Run the installer once per workspace to make your Hermes agent permanently less verbose. This is not a per-turn skill — it is a one-time installer that injects always-on rules into your project's context file.

## Procedure

To install or update talk-normal in the current workspace:

```bash
bash install.sh
```

The script auto-detects your workspace config file (`.hermes.md`, `HERMES.md`, or `AGENTS.md`) and injects the prompt between `# --- talk-normal BEGIN ---` and `# --- talk-normal END ---` markers. The installer is idempotent: running it again replaces the existing talk-normal block in place with the latest rules. Nothing else in your config file is touched.

To remove:

```bash
bash install.sh --uninstall
```

Start a new Hermes session to take effect.

## What gets installed

The contents of `prompt.md` get injected into your workspace config file. The rules target the specific slop patterns that make LLM output sound corporate and padded:

- **Filler and hedging** — banned opening phrases, no throat-clearing, no restating the question
- **Structural discipline** — lead with the answer, match depth to complexity, bullets only when genuinely parallel
- **Closing patterns** — no summary stamps, no hypothetical follow-up offers, no conditional next-step menus
- **Rhetorical tics** — no negation-based contrastive framing, no plain-language restatements
- **Shape of comparisons** — give a recommendation with brief reasoning, cap pros/cons lists

## Verification

After installing, start a new Hermes session and ask a simple question like "What is Python?". The response should be 3-5 sentences with no filler phrases. Compare against the benchmarks at https://github.com/hexiecs/talk-normal for expected output.

## Pitfalls

- **Security scanner**: Hermes flags this skill as "DANGEROUS" because it modifies `AGENTS.md` (persistent prompt modification). This is expected — the skill's entire purpose is injecting always-on prompt rules. Install with `hermes skills install --force hexiecs/talk-normal/hermes`.
- Rules only take effect in a **new session** — Hermes freezes context files at session start.
- If you have both `.hermes.md` and `AGENTS.md`, the installer writes to whichever it finds first (`.hermes.md` > `HERMES.md` > `AGENTS.md`).

## Upstream and issues

- Source: https://github.com/hexiecs/talk-normal
- Issues and rule suggestions: https://github.com/hexiecs/talk-normal/issues
