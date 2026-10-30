# Changelog

All notable changes to talk-normal will be recorded here. Format loosely follows [Keep a Changelog](https://keepachangelog.com/).

## Unreleased

- Give the Hermes bundle a Python installer with explicit project, file, and profile-wide scopes, a dry-run preview, and atomic block updates. Profile-wide rules use `HERMES_HOME/SOUL.md`; project discovery stays inside its Git boundary. Preserve the Hermes installer during bundle sync, update both READMEs, and add offline installer tests with Linux, macOS, and Windows CI.

## Week of 2026-04-11

- Add `prompt-chatgpt.md`: a compressed variant of `prompt.md` built to fit ChatGPT's 1500-character custom-instructions field limit. Preserves all load-bearing rules (negation-frame ban, closing-stamp ban, conditional-menu ban, filler list, BAD/GOOD few-shot examples). Compressed version clocks in at 1400 chars (100-char margin). Use `prompt.md` for OpenClaw / API / Cursor / Continue where there is no length cap; use `prompt-chatgpt.md` only for the ChatGPT custom-instructions field. Motivated by a real bug report on Twitter from @ppdng: `prompt.md` v0.6.1 is 3527 chars and does not fit in a 1500-char field.
- Publish talk-normal to the ClawHub skill registry. `clawhub install talk-normal` is now a one-line install path for OpenClaw users, alongside the existing paste-link-to-chat and manual `git clone` paths. ([c02afd1](https://github.com/hexiecs/talk-normal/commit/c02afd1))
- Make `install.sh` idempotent. Re-running it now performs an in-place update of the `talk-normal` block in your `AGENTS.md` instead of refusing and asking for `--uninstall` first. First run prints `Installed`, every subsequent run prints `Updated`. ([24fd1be](https://github.com/hexiecs/talk-normal/commit/24fd1be))
- Add version tracking to the install flow. `prompt.md` now has `<!-- talk-normal X.Y.Z -->` as its first line so you can `grep "talk-normal 0" AGENTS.md` to see which version is currently active. `install.sh` prints the version and absolute target path on every install/update. `sync-skill.sh` auto-reads the version from `prompt.md` and bumps `skill/SKILL.md` to match. Single source of truth is `prompt.md`. ([c576bd2](https://github.com/hexiecs/talk-normal/commit/c576bd2))
- Restructure the README OpenClaw install section into three labeled options: paste-link-to-chat (easiest), ClawHub, manual git clone. Order reflects real UX effort from fewest steps to most. Applies to both `README.md` and `README_CN.md`. ([23566d9](https://github.com/hexiecs/talk-normal/commit/23566d9))
- Iterate the "不是X，而是Y" ban across four rounds and converge it. Final version uses few-shot BAD/GOOD example pairs instead of pure prohibition, covers all variants (standard `不是X，而是Y`, reverse-order `X，而不是Y`, chained `不是A，不是B，而是C`, symmetric `适合X，不适合Y`), and moves the rule to position 2 of the rule list. Measured on a same-prompt stress test across versions: 6 → 4 → 3 → 0 → 0 → 0 violations per response. ([c455eb4](https://github.com/hexiecs/talk-normal/commit/c455eb4))
- Ban summary-stamp closings structurally, in any variant, in any language. Adds English ("In conclusion", "In summary", "Hope this helps", "Feel free to ask") and Chinese ("一句话总结", "一句话落地", "一句话讲", "一句话概括", "总结一下", "简而言之", "概括来说", "总而言之") named stamps, plus structural patterns ("一句话X：", "X一下：") that catch future variants the author has not thought of yet. Rule intent is now position-aware rather than a word list. ([0169c73](https://github.com/hexiecs/talk-normal/commit/0169c73))
- Add `regressions/` directory tracking iterative rule improvements with measured leak counts across prompt versions. First file is `rule-17-negation-frame.md`, documenting the full iteration arc from v0.3.0 to v0.6.1 with real GPT-5.4 excerpts from each failed version. Future rule iterations should follow the same format. ([9afd23b](https://github.com/hexiecs/talk-normal/commit/9afd23b))
- Ban conditional next-step menus ("如果你X，我就Y" / "if you want X, I can Y"). ([ed81683](https://github.com/hexiecs/talk-normal/commit/ed81683))
- Ban the "not X, but Y" corrective frame pattern ("不是X，而是Y"). ([87a297c](https://github.com/hexiecs/talk-normal/commit/87a297c))
- Kill redundant plain-language restatements ("翻成人话" / "in plain English"). ([d19acf1](https://github.com/hexiecs/talk-normal/commit/d19acf1))

## Week of 2026-04-04

- Broaden messaging: works with any LLM, not just GPT. ([dd4b8ef](https://github.com/hexiecs/talk-normal/commit/dd4b8ef))
- Rename project from `normal-gpt` → `talk-normal` to match multi-LLM positioning. ([fde64c5](https://github.com/hexiecs/talk-normal/commit/fde64c5))
- Add direct link to ChatGPT custom instructions settings. ([845207e](https://github.com/hexiecs/talk-normal/commit/845207e))
- Add paste-link-to-chat install method for OpenClaw. ([e3c928b](https://github.com/hexiecs/talk-normal/commit/e3c928b))
- Add Chinese README with language switcher. ([9e1f714](https://github.com/hexiecs/talk-normal/commit/9e1f714))
