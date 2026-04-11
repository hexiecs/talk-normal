# talk-normal

[English](README.md) | 中文

让任何 LLM 说人话。不废话, 不客套, 直接给答案。

欢迎贡献。参见 [CONTRIBUTING.md](CONTRIBUTING.md), 在 [Issues](https://github.com/hexiecs/talk-normal/issues/new/choose) 提交规则建议。最新规则变更见 [CHANGELOG.md](CHANGELOG.md)。

## 它做什么

一段 system prompt, 把 LLM 啰嗦的、客服腔的输出变成直接、有信息量的回答。适用于任何模型 (GPT, Gemini, LLaMA 等)。在 GPT-4o-mini 上测试 **减少 71%** 输出长度, GPT-5.4 上 **减少 56%**, 同时保留所有有用信息。[查看 10 个测试问题的完整对比](TEST_RESULTS.md)。

**问题: "What is Python?"**

<details>
<summary>改造前 (GPT-4o-mini, 1584 字符)</summary>

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

改造后 (GPT-4o-mini, 588 字符):
> Python is a high-level, interpreted programming language known for its readability and versatility. It supports multiple programming paradigms, including procedural, object-oriented, and functional programming. Python is widely used in web development, data analysis, artificial intelligence, scientific computing, and automation due to its extensive libraries and frameworks. Its simplicity makes it an excellent choice for beginners and experienced developers alike.

### 真实案例: 金融市场分析

这个案例直接促使我做了这个项目。

<details>
<summary>问题 (点击展开) — 解读交易员的市场评论</summary>

> 解读：There were quite a lot of overreactions in the market today, in things like energy, fertilizers, ags etc, that basically reflect a view that the strait will pretty much immediately reopen. If you'll allow me to get a little bit (maybe unnecessarily) wordy…
>
> Our view, which has been unchanged by developments this week, is:
>
> The strait will gradually reopen, but the conflict will likely drag on due to the complex nature of Iran/US/GCC/Israel relations. This is why we continue to feel that the curve in crude flattens out - you can see today that CLZ6 closed green despite the front month being down 15%. That's exactly what we expect, and it likely has room to go as the market comes to terms with this.
>
> However, despite the crude oil curve reflecting this view, equities (as usual) went a little cuckoo. The aggressive gaps down in petrochemical, fertilizer, tanker and refiner names was grossly overdone and will likely completely be made back up by the end of the week.
>
> These names will continue to be volatile on headlines but the fundamental picture has not changed much, if at all, for them.
>
> On the other side, it's interesting to see that the rally in equities held strong. I'd reiterate that equities really just need to be comfortable with the assurance that the strait will reopen in time to avoid economic catastrophe. As long as they are comfortable with that, they can climb further. People are likely confused seeing the headlines about how the ceasefire was violated or how missiles are still flying etc etc. That doesn't matter that much for equities. War happens, it's normally reasonably bullish for stocks over 6 month time periods. It's *only* the strait being closed *for an extended period of time* that impacts them. The fact is that as long as the negotiations are taking place, and as long as there's hope for disaster to be avoided (as would almost certainly come from a prolonged complete closure), then crude oil being at ~90 for the rest of the year instead of 70 is not such a huge deal for stocks.
>
> While the war has dominated the news, the economic data we've gotten over the past two weeks has been pretty much unanimously positive. We'll see if there's any impact from elevated commodity prices in March's data, but I wouldn't expect too much in the way of immediate impact.
>
> Just as we saw some overly pessimistic predictions last week, we're starting to see some overly optimistic predictions now. I think being pragmatic about this gets you to conclude that things are undeniably better than they were 7 days ago and the market should reflect that, but it's not like we are completely out of the woods.
>
> I'm really liking the energy security basket that we published in our last piece and am looking for any opportunities to buy there. Verbio, for example (EU biofuel name) took a -16% day…that seems like a pretty easy buy. The increased demand for biofuel won't just vanish in the EU, nor will the even more significant focus on how precariously perched they are on the edge of an economic collapse if they don't put money into energy.
>
> The absolute worst thing you can be doing in an environment like this is changing your view every single day. If you're finding yourself doing that, it means you probably shouldn't have had a view in the first place. The best approach is being humble enough to admit you don't know what will happen over the next week or so, but have a solid and comprehensive view as to what trends will emerge due to (or continue in spite of) the new multipolar world we're in.
>
> These are the environments where traders and investors are most likely to make really, really stupid mistakes that cost a lot of money and could be avoided by simply being a little more careful & considered. Be chill, don't become a zealot for one outcome or the other, look for real opportunities.

</details>

<details>
<summary>改造前 (GPT-5.4, ~4500 字符) — 让我忍无可忍的回答</summary>

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
> 1\. 市场把"海峡会逐步重开"错当成了"风险立刻归零"
>
> 他说今天很多板块跌太狠：
>
> * energy
> * fertilizers
> * ags
> * tankers
> * refiners
> * petrochemicals
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
> * 保险恢复正常
> * 航运费用恢复正常
> * 能源安全焦虑消失
> * 欧洲/海湾国家新增能源投资撤回
> * 化肥、农业链的供给担忧瞬间消失
>
> 所以股票如果按"最坏没发生 = 一切恢复原样"去跌，确实容易跌过头。
>
> ───
>
> 2\. 他最核心的交易表达其实是：原油曲线走平（curve flattens）
>
> 这段最关键的一句就是：
>
> front month 大跌，但 CLZ6 还收绿盘，正是我们想看到的。翻译成交易语言就是：
>
> * 近月油价之前计入了太多"立即断供"
> * 停火/重开消息出来，近月风险溢价先吐
> * 但远月不会回到"世界和平、供应无忧"的旧定价
> * 所以 backwardation 会收窄
>
> 这和你现在 PORTFOLIO.md 里已经持有的 CLZ6 多头逻辑是基本一致的。
> 也就是：
>
> 不是赌前月继续疯涨，而是赌长期风险溢价被市场低估。这一点我觉得他讲得很清楚，而且是整段里最有价值的部分。
>
> ───
>
> 3\. 股票比原油更容易"发疯"
>
> 他说了一句很准：
>
> crude curve 反而比 equities 更诚实。这我认同。
>
> 因为商品市场会更快去拆：
>
> * immediate disruption
> * medium-term supply friction
> * long-term incentive pricing
>
> 但股票经常一把梭：
>
> * 先恐慌
> * 再狂欢
> * 再反悔
>
> 所以像：
>
> * petrochem
> * fertilizer
> * tanker
> * refiner
> * EU energy security names
>
> 这种板块，确实很容易在 headline 下出现过度 gap down。
>
> ───
>
> 4\. 为什么大盘还能涨
>
> 这段里第二个重要点是：
>
> 股票不需要"完全和平"，只需要确认不会出现长期封锁海峡导致全球经济灾难。这句话很重要。
>
> 他的意思不是：
>
> * 战争利好一切
>
> 而是：
>
> * 只要不演变成 prolonged complete closure
> * 那么油价在 90 而不是 70
> * 对股票市场来说不是世界末日
>
> 所以：
>
> * 导弹还在飞
> * ceasefire 被局部破坏
> * 黎巴嫩线还有摩擦
>
> 这些对大盘不是零影响，但也不是决定性变量。
> 真正决定股票能不能继续涨的是：
>
> 市场是否相信"不会演成全球能源灾难"。这个判断我觉得也对。
>
> ───
>
> 我最认同的三点
>
> 第一，别每天改 worldview
>
> 这句我非常认同：
>
> 最糟糕的做法就是每天改观点。市场最容易亏大钱的时候，就是这种环境：
>
> * 周一觉得世界末日
> * 周二觉得和平来了
> * 周三又觉得大战升级
> * 来回追
>
> 这种会被市场狠狠干死。
>
> 第二，要把"短期波动"和"中期结构趋势"分开
>
> 他说得本质上是：
>
> * 短期： headlines 很乱，别自信预测一周内怎么走
> * 中期：多极化世界下，能源安全、军费扩张、供应链防御这些趋势不会因为两周谈判消失
>
> 这个框架是成熟的。
>
> 第三，能源安全篮子没那么容易证伪
>
> 他点名 Verbio 这种 EU biofuel name 大跌是 easy buy。
> 背后逻辑是：
>
> 欧洲不会因为停火两周就突然不担心能源安全了。这个方向我觉得对，但我会比他稍微谨慎一点，因为个股层面还得看：
>
> * 政策补贴
> * 原料价差
> * biofuel economics
> * 欧洲工业需求
>
> 所以方向对，个股不一定每只都 easy。
>
> ───
>
> 我觉得这段也有两个潜在问题
>
> 1\. 他对"被错杀会在本周末前完全修复"这句，有点太满
>
> 这句是：
>
> likely completely be made back up by the end of the week。我觉得这个判断太交易员口吻了，没有前面框架那么稳。
>
> 因为即便逻辑对，也不代表：
>
> * 修复发生得这么快
> * 所有板块同步修复
> * macro desks 不继续压低 beta
>
> 所以我会把它理解为：
>
> 方向上错杀，时间上未必这么快。
>
> 2\. 他对股票的乐观，建立在经济数据继续好
>
> 他说过去两周经济数据几乎都不错。
> 这个没错，但股票能不能继续 hold 住，还要看：
>
> * 3月/4月通胀传导
> * commodity pass-through
> * consumer confidence
> * 后续谈判有没有反复
>
> 所以：
>
> 股票现在"不是灾难"，不等于"可以无脑一路冲"。
>
> ───
>
> 如果把这段压缩成最实用的交易含义
>
> 对原油
>
> * 前月暴跌不代表整个能源逻辑结束
> * 更合理的是 curve flatten
> * 远月相对更抗跌
>
> 对能源/化工/化肥/油运股
>
> * 今天的暴跌更像过度反应
> * 因为 reopening ≠ normalisation
> * 基本面并没有像股价那样瞬间恶化/改善
>
> 对大盘
>
> * 只要霍尔木兹不是长期彻底封死
> * 股票就能继续修复
> * 市场真正怕的是经济灾难，不是"还有导弹在飞"
>
> 对操作
>
> * 别每天追 headline
> * 看中期趋势，不看日内情绪
> * 重点找"结构逻辑没变、但被价格打穿"的标的
>
> ───
>
> 我的最终评价
>
> 这段不是鸡血文，质量挺高。
> 它最有价值的地方在于：
>
> 它把"灾难没发生"和"风险没结束"同时说清楚了。也就是：
>
> * 比上周好，没错
> * 但远没到 all clear，没错
> * 所以最合理的仓位表达不是极端看空，也不是极端乐观
> * 而是抓 curve flattening + energy security + 错杀修复
>
> 如果你要，我下一条我可以直接给你做成：
>
> "这段话对应到可交易标的，应该怎么拆成 5 个最值得看的方向。"

</details>

<details>
<summary>改造后 (GPT-5.4 + talk-normal) — 同样的信息量, 1/3 的长度, 没有废话, 没有"如果你要我还可以...", 读起来像人写的分析</summary>

> 这段的核心就一句话：
>
> 市场把"最坏情况缓解"错误交易成了"风险已经结束"。
>
> 具体拆开看：
>
> 1. **他在讲什么**
>   * 这里的 the strait 基本就是在指 霍尔木兹海峡。
>   * 市场今天大跌能源、化肥、农业链，是在押注：海峡很快完全恢复，能源风险溢价迅速消失。
>   * 他的观点不是这个。他认为：会逐步恢复，但冲突不会很快结束，所以长期风险溢价还在。
> 2. **为什么他说原油曲线比股票更聪明**
>   * 前月油大跌，但 CLZ6 这种远月油还收涨，说明市场开始接受一件事：
>   * 短期最恐慌的断供风险在缓解
>   * 但 中长期地缘政治风险、能源安全溢价没有消失
>   * 所以不是"油价彻底回到战前逻辑"，而是 近月回吐，远月更抗跌，曲线走平
> 3. **为什么他觉得能源/化肥/油运/炼化股跌过头**
>   * 这些股票今天像在交易"问题解决了"，但他认为基本面没那么快变。
>   * 只要冲突还拖着，能源安全、供应链脆弱、库存/运输风险 这些逻辑都还在。
>   * 所以他判断这类股票的跳空下杀是 情绪化定价错误，不是基本面重估。
> 4. **为什么大盘还能涨**
>   * 他对股票市场的理解很现实：
>   * 股市不需要世界恢复和平，只需要别发展成全球经济灾难。
>   * 只要市场相信海峡不会长期关闭，哪怕油价全年在 90 而不是 70，股市也未必扛不住。
>   * 过去两周经济数据也偏正面，所以风险资产有支撑。
> 5. **他真正强调的交易方法**
>   * 不要每天跟着 headline 改观点。
>   * 短期走势可以乱，但你要抓的是 未来几个月会持续存在的结构性趋势。
>   * 也就是：别赌单日新闻，去买"市场错杀但中期逻辑没坏"的东西。
> 6. **这段话对应的交易含义**
>   * 偏多：远月原油、能源安全主题、被错杀的化肥/油运/炼化/欧洲替代能源
>   * 偏中性偏多：大盘权益
>   * 不看好的交易：把今天的回落理解成战争风险彻底结束，然后去系统性砍能源链
> 7. **这段话最大的反向风险**
>   * 如果谈判推进 比他预期快得多，那远月油和能源安全篮子也会被继续压缩估值。
>   * 另一条风险是 高商品价格后续传导到通胀/增长，那"股市只要海峡重开就没事"这条逻辑会变脆。
>
> 我的解读：这是一个很典型的 Citrini 式框架，不是看战争输赢，而是看"风险溢价该消失多少、不该消失多少"。重点不在预测明天，而在抓住未来1到3个月哪些资产被市场瞎杀了。

</details>

## 使用方法

### OpenClaw

三种安装方式, 按你习惯的来:

**方式 1: ClawHub (更新最方便)**

```bash
clawhub install talk-normal
bash skills/talk-normal/install.sh
```

以后要拉最新规则:

```bash
clawhub update talk-normal
bash skills/talk-normal/install.sh
```

**方式 2: 粘贴 GitHub 链接到聊天框**

把这个链接粘贴到 OpenClaw 聊天框, 让它帮你安装:

```
https://github.com/hexiecs/talk-normal
```

**方式 3: 手动 git clone**

```bash
git clone https://github.com/hexiecs/talk-normal.git && cd talk-normal && bash install.sh
```

三种方式最终都跑同一个 `install.sh`, 它会自动找到你的 `AGENTS.md`, 把规则注入到 `# --- talk-normal BEGIN ---` 和 `# --- talk-normal END ---` 标记之间。脚本是幂等的, 任何时候重新跑一次就能更新到最新规则, 不会影响你 `AGENTS.md` 里的其他内容。

卸载:
```bash
bash install.sh --uninstall
```

开一个新对话即可生效。

### ChatGPT 自定义指令

把 `prompt.md` 的内容复制到 ChatGPT 的[自定义指令](https://chatgpt.com/#settings/Personalization)里。

### 其他 OpenAI API 工具

把 `prompt.md` 的内容复制到你使用的工具的 system prompt 字段 (Cursor, Continue, 或你自己的应用)。

### API 调用

```bash
curl https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o-mini",
    "messages": [
      {"role": "system", "content": "<prompt.md 的内容>"},
      {"role": "user", "content": "What is Python?"}
    ]
  }'
```

## 测试结果

10 个问题, temperature=0, 按字符数统计。[查看每个问题的完整回答对比](TEST_RESULTS.md)。

### GPT-4o-mini — 平均减少 71%

| # | 问题 | 原始 | talk-normal | 减少 |
|---|------|------|-----------|------|
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

### GPT-5.4 — 平均减少 56%

| # | 问题 | 原始 | talk-normal | 减少 |
|---|------|------|-----------|------|
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

GPT-5.4 本身就比 4o-mini 简洁不少。talk-normal 在两个模型上都能将啰嗦回复减少 38-87%。

## 许可证

MIT
