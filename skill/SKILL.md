---
name: talk-normal
slug: talk-normal
description: Stop LLM slop. A curated system prompt that cuts verbose, corporate-sounding LLM output by 56-71% (measured) while preserving information. Works bilingually (English + Chinese). Installs into your AGENTS.md as an always-on behavior modifier.
version: 0.6.0
tags: [prompt, anti-slop, concise, system-prompt, chinese, bilingual, always-on]
homepage: https://github.com/hexiecs/talk-normal
license: MIT
---

# talk-normal

A curated system prompt that stops your LLM from writing like a LinkedIn post. Measured: 71% character reduction on GPT-4o-mini, 56% on GPT-5.4, across 10 prompts in English and Chinese, without losing information.

## What this skill does

When invoked, this skill installs the talk-normal rules into your workspace's `AGENTS.md` file as an always-on behavior modifier. After install, every reply your OpenClaw agent produces follows the rules in `prompt.md`. The rules live between `# --- talk-normal BEGIN ---` and `# --- talk-normal END ---` markers so they do not conflict with your existing rules in `AGENTS.md`.

This is not a workflow skill you invoke per turn. It is a one-time installer that makes your agent permanently less verbose until you uninstall.

## How to run

To install or update talk-normal in the current workspace:

```bash
bash install.sh
```

The script is idempotent: running it again replaces the existing talk-normal block in place with the latest rules. Nothing else in your `AGENTS.md` is touched.

To remove:

```bash
bash install.sh --uninstall
```

## What gets installed

The contents of `prompt.md` get injected into your `AGENTS.md`. The rules target the specific slop patterns that make LLM output sound corporate and padded, grouped into a few categories:

- **Filler and hedging** — banned opening phrases ("Great question", "I'd be happy to", "让我们一起来看看"), no throat-clearing, no restating the question
- **Structural discipline** — lead with the answer, match depth to complexity, use bullets only when content is genuinely parallel, cap explanations for conceptual questions
- **Closing patterns** — no "In summary" / "Hope this helps" / "综上所述", no hypothetical follow-up offers, no conditional next-step menus ("If you want I can also...")
- **Rhetorical tics** — no "不是X，而是Y" / reject-then-correct framing in any variant, no plain-language restatements ("翻成人话", "in other words")
- **Shape of comparisons** — give a recommendation with brief reasoning, cap pros/cons lists, no balanced-essay posture

The exact rule list lives in `prompt.md` and evolves as new slop patterns get caught in the wild. Every commit to that file is a named slop pattern killed.

## Updating to the latest rules

```bash
clawhub update talk-normal
bash install.sh
```

The first command pulls the latest skill bundle from ClawHub. The second command re-runs the idempotent installer, replacing the old rule block in `AGENTS.md` with the new one.

## Compatibility

Works on any LLM that honors system prompts or custom instructions: GPT-5.4, GPT-4o-mini, Claude 4.6, Gemini 2.5, Grok 3, Qwen 3, DeepSeek V3, and others. OpenClaw integration is via `AGENTS.md` injection, which the agent reads on every turn.

## Measured effect

Full benchmark data for 10 prompts across GPT-4o-mini and GPT-5.4 is in `TEST_RESULTS.md` in the upstream repository. Average reduction: 71% on GPT-4o-mini, 56% on GPT-5.4, while preserving the information content of the original response.

## Upstream and issues

- Source: https://github.com/hexiecs/talk-normal
- Issues and rule suggestions: https://github.com/hexiecs/talk-normal/issues
- Contributing: see `CONTRIBUTING.md` in the upstream repo for the rule-submission format

## License

MIT
