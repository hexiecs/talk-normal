# normal-gpt

Make GPT talk like a normal person. No filler, no fluff, just the answer.

## What it does

A single system prompt that transforms GPT's verbose, corporate-sounding output into direct, informative responses. Tested on GPT-4o-mini (**71% reduction**) and GPT-5.4 (**56% reduction**) while preserving all useful information. [See full comparison with all 10 test questions and complete answers](TEST_RESULTS.md).

**Question: "What is Python?"**

<details>
<summary>Before (GPT-4o-mini, 1584 chars)</summary>

> Python is a high-level, interpreted programming language known for its readability and simplicity. It was created by Guido van Rossum and first released in 1991. Python supports multiple programming paradigms, including procedural, object-oriented, and functional programming, making it versatile for various applications.
>
> Key features of Python include:
>
> 1. **Readability**: Python's syntax is designed to be clear and easy to understand, which helps developers write and maintain code more efficiently.
>
> 2. **Dynamic Typing**: Python uses dynamic typing, meaning that variable types are determined at runtime, allowing for more flexibility in coding.
>
> 3. **Extensive Libraries**: Python has a rich ecosystem of libraries and frameworks, such as NumPy, Pandas, Matplotlib, Django, and Flask, which facilitate tasks ranging from data analysis to web development.
>
> 4. **Cross-Platform**: Python is available on various operating systems, including Windows, macOS, and Linux, making it a cross-platform language.
>
> 5. **Community Support**: Python has a large and active community, which contributes to a wealth of resources, tutorials, and third-party modules.
>
> 6. **Interpreted Language**: Python code is executed line by line, which can make debugging easier and allows for interactive programming.
>
> Python is widely used in various domains, including web development, data science, artificial intelligence, machine learning, automation, and scientific computing, among others. Its versatility and ease of use have made it one of the most popular programming languages in the world.

</details>

After (GPT-4o-mini, 588 chars):
> Python is a high-level, interpreted programming language known for its readability and versatility. It supports multiple programming paradigms, including procedural, object-oriented, and functional programming. Python is widely used in web development, data analysis, artificial intelligence, scientific computing, and automation due to its extensive libraries and frameworks. Its simplicity makes it an excellent choice for beginners and experienced developers alike.

### Real-world example: financial market analysis

This is the actual case that motivated building normal-gpt. The question was asking GPT to interpret a trader's market commentary about the Strait of Hormuz crisis, energy stocks, and crude oil curve dynamics.

<details>
<summary>Before (GPT-5.4, ~4500 chars) — the response that made me snap</summary>

> 这段我觉得整体是对的，而且是很成熟的中间派框架。
>
> 一句话先说：
>
> 他不是在说"战争没事了"，而是在说"最坏情景没发生，但长期摩擦也没消失"。
> 所以交易上应该是：
> 前月油跌，远月没那么该跌，能源安全链和被错杀的相关股票会修复，全球权益只要不再交易"经济灾难"就还能涨。
>
> ───
>
> 这段话的核心逻辑
>
> 1. 市场把"海峡会逐步重开"错当成了"风险立刻归零"
>
> 他说今天很多板块跌太狠：
>
> • energy
> • fertilizers
> • ags
> • tankers
> • refiners
> • petrochemicals
>
> 背后反映的是一种很激进的定价：
>
> 市场在按"霍尔木兹几乎马上完全恢复正常"来交易。而他的观点不是这个。
>
> 他的观点是：
>
> 会重开，但会很慢，而且战争/摩擦会拖很久。这点我认为是对的。
> 因为"通行恢复"不等于：
>
> • 保险恢复正常
> • 航运费用恢复正常
> • 能源安全焦虑消失
> • 欧洲/海湾国家新增能源投资撤回
> • 化肥、农业链的供给担忧瞬间消失
>
> 所以股票如果按"最坏没发生 = 一切恢复原样"去跌，确实容易跌过头。
>
> ───
>
> 2. 他最核心的交易表达其实是：原油曲线走平（curve flattens）
>
> *(continues for another ~3000 chars with sections on stock reactions, trading methodology, personal assessments, risk warnings, and offers to do more analysis...)*

</details>

After (GPT-5.4 + normal-gpt, ~1500 chars):
> 这段的核心就一句话：
>
> 市场把"最坏情况缓解"错误交易成了"风险已经结束"。
>
> 具体拆开看：
>
> 1. **他在讲什么** — 市场今天大跌能源、化肥、农业链，是在押注海峡很快完全恢复。他的观点不是这个。他认为会逐步恢复，但冲突不会很快结束，长期风险溢价还在。
>
> 2. **原油曲线比股票更聪明** — 前月油大跌，但远月还收涨。说明短期断供风险在缓解，但中长期地缘政治风险没有消失。曲线走平。
>
> 3. **能源/化肥/油运/炼化股跌过头** — 这些股票在交易"问题解决了"，但基本面没那么快变。情绪化定价错误，不是基本面重估。
>
> 4. **大盘还能涨** — 股市不需要世界恢复和平，只需要别发展成全球经济灾难。只要市场相信海峡不会长期关闭，油价全年在 90 而不是 70，股市也未必扛不住。
>
> 5. **交易方法** — 不要每天跟着 headline 改观点。抓未来几个月会持续存在的结构性趋势。买"市场错杀但中期逻辑没坏"的东西。
>
> 6. **最大反向风险** — 谈判推进比预期快，远月油和能源安全篮子也会被继续压缩。高商品价格传导到通胀/增长，"海峡重开就没事"这条逻辑会变脆。

## Usage

### OpenClaw (one command)

```bash
git clone https://github.com/hexie/normal-gpt.git && cd normal-gpt && bash install.sh
```

Uninstall:
```bash
bash install.sh --uninstall
```

The script auto-detects your `AGENTS.md` and injects the prompt. Start a new conversation to take effect.

### ChatGPT custom instructions

Copy the contents of `prompt.md` into ChatGPT's custom instructions field.

### Any OpenAI API tool

Copy the contents of `prompt.md` into the system prompt field of whatever tool you use (Cursor, Continue, your own app, etc.)

### API calls

```bash
curl https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o-mini",
    "messages": [
      {"role": "system", "content": "<contents of prompt.md>"},
      {"role": "user", "content": "What is Python?"}
    ]
  }'
```

## Test results

10 prompts, temperature=0. Measured in characters. [Full responses for every question](TEST_RESULTS.md).

### GPT-4o-mini — average reduction: 71%

| # | Prompt | Original | normal-gpt | Reduction |
|---|--------|----------|-----------|-----------|
| 1 | TCP vs UDP? | 2516 | 829 | 67% |
| 2 | What is Python? | 1584 | 588 | 62% |
| 3 | Explain how HTTP works | 3713 | 929 | 74% |
| 4 | How does DNS work? | 3124 | 1040 | 66% |
| 5 | Is React better than Vue? | 2393 | 294 | 87% |
| 6 | Docker和虚拟机有什么区别? | 2170 | 819 | 62% |
| 7 | 什么是机器学习? | 1471 | 545 | 62% |
| 8 | 什么是区块链? | 1071 | 577 | 46% |
| 9 | Redis和Memcached哪个好? | 1857 | 333 | 82% |
| 10 | Microservices pros/cons | 3393 | 691 | 79% |

### GPT-5.4 — average reduction: 56%

| # | Prompt | Original | normal-gpt | Reduction |
|---|--------|----------|-----------|-----------|
| 1 | TCP vs UDP? | 1000 | 611 | 38% |
| 2 | What is Python? | 751 | 609 | 18% |
| 3 | Explain how HTTP works | 5222 | 1707 | 67% |
| 4 | How does DNS work? | 2563 | 1207 | 52% |
| 5 | Is React better than Vue? | 1158 | 681 | 41% |
| 6 | Docker和虚拟机有什么区别? | 3052 | 1410 | 53% |
| 7 | 什么是机器学习? | 1896 | 871 | 54% |
| 8 | 什么是区块链? | 2312 | 935 | 59% |
| 9 | Redis和Memcached哪个好? | 3197 | 1154 | 63% |
| 10 | Microservices pros/cons | 3838 | 1712 | 55% |

GPT-5.4 is already more concise than 4o-mini out of the box. normal-gpt still cuts verbose responses by 38-87% on both models.

## License

MIT
