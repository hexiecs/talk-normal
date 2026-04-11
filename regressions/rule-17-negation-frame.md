# Regression: "reject-then-correct" negation frame

**Rule:** Do not open a positive claim by first negating an alternative. Covers `"不是X，而是Y"` / `"It's not X, it's Y"` and all variants.

**Source model:** GPT-5.4

**Test input:** a commentary on Marc Andreessen's "five traits of innovators" framework (open ended, ~300 words of context), asking the model to summarize + give its take. This prompt reliably exercises the pattern because the natural rhetorical move is to reject the reader's assumed answer before stating the real one.

## Leak count over time

| Version | Rule state | Leak count | Notes |
|---|---|---|---|
| v0.2.x (no rule) | not present | many | "不是X而是Y" showed up in almost every contrastive sentence |
| v0.3.0 (initial rule) | single-line rule banning the phrase as "a rhetorical device" | **6** | Rule read but model kept interpreting its own usage as non-rhetorical technical distinction |
| v0.3.1 (tightened) | expanded to cover variants, removed the "rhetorical device" escape hatch, kept at position 14 (last) | **4** | All four leaks were classic form in the first 3 paragraphs |
| v0.4.0 (reordered + meta rule) | rule promoted to position 2, added a top-of-prompt meta constraint naming it as "your single hardest constraint", added "chained negations" variant | *target: 0-1* | pending verification |

## v0.3.1 leak excerpts

From a real GPT-5.4 response to the Andreessen prompt after installing `v0.3.1`:

1. Opening sentence: `"真正的创新者不是'有创意的人'，而是五种特质同时拉满的稀有人"`
2. Mid-paragraph: `"创新的瓶颈常常不是钱，不是想法，而是'能把想法熬成现实的那种人'太少"` (chained negation form)
3. Mid-paragraph: `"最关键的其实不是'五项清单'本身，而是中间那个张力"`
4. Closing: `"这条讲的不是'天才灵感'，讲的是'极少数人怎么把反常识想法扛过漫长现实'"`

## Why v0.3.1 still leaked

Two hypotheses:

1. **Attention decay by rule position.** rule 17 was the last of 14 rules. Specific structural rules (like "do not use this sentence shape") need more salience than word-level bans because the model has strong priors about how to express contrast in natural language. Putting a structural rule last gives it the least weight.
2. **No meta-level framing.** The rule named the problem but did not mark it as the hardest constraint. The model treated it as equivalent in priority to "pros/cons: max 3-4 points per side", which is a much easier rule to follow.

## v0.4.0 fix

Three changes in `prompt.md`:

1. **Promoted the rule to position 2**, right after "Lead with the answer". It is now the second thing the model sees in the rules block.
2. **Added a top-level meta constraint** before the Rules: list:
   > Your single hardest constraint: prefer direct positive claims. Do not use rejection-then-correction phrasing in any language. If you catch yourself about to write "不是X，而是Y" or "it's not X, it's Y", restructure before you start.
3. **Added the "chained negations" variant** explicitly to the rule text, to catch forms like `"不是A，不是B，而是C"` that the v0.3.1 test hit.

## How to re-run this test

1. Install the latest `prompt.md` via any of the supported paths (`clawhub install talk-normal && bash skills/talk-normal/install.sh`, paste GitHub link into OpenClaw, or manual `git clone`).
2. Start a fresh GPT-5.4 conversation in OpenClaw or ChatGPT custom instructions.
3. Paste the Andreessen "five traits of innovators" context (or any open-ended commentary prompt that asks for a summary + take).
4. Count occurrences of the pattern in the response. Target is 0 to 1. Anything above 2 means the rule is still not holding and needs further iteration.

## Related observations from the same test

- `"一句话总结"` as a closing header was not caught by v0.3.1 rule 15 because the rule only listed English variants ("In conclusion", "In summary", "Hope this helps", "Feel free to ask"). Fixed in v0.4.0 by adding Chinese summary-stamp closers (`一句话总结`, `总结一下`, `简而言之`, `概括来说`, `总而言之`) to the same rule.
- No violations of the "hypothetical follow-up offer" rule (no `"如果你愿意，我可以..."` at the end of the response). This rule is holding in both v0.3.1 and expected to hold in v0.4.0.
