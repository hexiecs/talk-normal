# talk-normal

English | [中文](README_CN.md)

Make any LLM talk like a normal person. No filler, no fluff, just the answer.

Contributions welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) and open a rule suggestion in [Issues](https://github.com/hexiecs/talk-normal/issues/new/choose). Recent rule history in [CHANGELOG.md](CHANGELOG.md).

## What it does

A single system prompt that transforms verbose, corporate-sounding LLM output into direct, informative responses. Works with any model (GPT, Gemini, LLaMA, etc.). Tested on GPT-4o-mini (**73% reduction**) and GPT-5.4 (**72% reduction**) while preserving all useful information. [See full comparison with all 10 test questions and complete answers](TEST_RESULTS.md).

**Question: "What is Python?"**

<details>
<summary>Before (GPT-4o-mini, 1583 chars)</summary>

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

After (GPT-4o-mini, 513 chars):
> Python is a high-level, interpreted programming language known for its readability and simplicity. It supports multiple programming paradigms, including procedural, object-oriented, and functional programming. Python has a large standard library and a vibrant ecosystem of third-party packages, making it suitable for web development, data analysis, artificial intelligence, scientific computing, and more. Its versatility and ease of use make it a popular choice among beginners and experienced developers alike.

### Real-world example: financial market analysis

This is the actual case that motivated building talk-normal.

<details>
<summary>Question (click to expand) — interpreting a trader's market commentary</summary>

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
<summary>Before (GPT-5.4, 7358 chars) — the response that made me snap</summary>

> 这段话本质上是在讲：**市场对中东局势的短期反应太情绪化了，很多资产今天跌/涨得过头；真正更合理的判断是，风险没有完全解除，但也没有糟到“全球经济灾难”那一步，所以应该避免每天跟着新闻来回改观点。**
> 
> 我给你分层解读。
> 
> ---
> 
> ## 一、先说这段话的大意
> 
> 作者的核心观点是：
> 
> 1. **霍尔木兹海峡（the strait）大概率会逐步恢复通行**，不会长期完全关闭。  
> 2. **但冲突不会马上结束**，因为伊朗、美国、海湾国家（GCC）、以色列之间关系太复杂。  
> 3. 所以，**原油不会回到“完全没事”的状态**，但也不会一直维持最极端的恐慌定价。  
> 4. 市场今天在一些板块上反应过度了，尤其是：
>    - 能源
>    - 化肥
>    - 农业
>    - 石化
>    - 油轮
>    - 炼油
> 5. **股票市场真正怕的不是“战争本身”，而是霍尔木兹海峡长期关闭**，因为那才会引发全球能源供应冲击和经济灾难。  
> 6. 只要市场相信海峡最终会 reopen（重开），即使油价全年在 90 美元而不是 70 美元，**对股市也未必是致命打击**。  
> 7. 投资上最糟糕的做法是：**每天被新闻带着跑，不断改变自己的判断。**
> 
> ---
> 
> ## 二、逐段翻译+解释
> 
> ---
> 
> ### 1）“There were quite a lot of overreactions in the market today...”
> > 今天市场里有很多过度反应，比如能源、化肥、农业这些板块，基本上反映的是一种看法：海峡很快就会立刻重新开放。
> 
> ### 解读
> 这里的“the strait”通常指 **霍尔木兹海峡**。  
> 霍尔木兹海峡是全球石油运输的关键通道，如果它被封锁，油价会暴涨，全球风险资产会承压。
> 
> 作者说今天很多板块的走势，已经在**提前交易“危机迅速解除”**这个剧本了。  
> 也就是说，市场有些人认为：  
> - 海峡马上恢复通行  
> - 供应风险迅速下降  
> - 所以能源、化肥、农业这些因地缘冲突受益的板块就该大跌
> 
> 作者觉得这种反应**太快、太猛、太乐观**。
> 
> ---
> 
> ### 2）“Our view... The strait will gradually reopen, but the conflict will likely drag on...”
> > 我们的观点是，这周发生的事情并没有改变我们的判断：海峡会逐步重开，但冲突很可能会拖延下去，因为伊朗/美国/GCC/以色列之间的关系非常复杂。
> 
> ### 解读
> 这是全文最核心的一句。
> 
> 作者不是极端悲观，也不是极端乐观，而是一个**中间偏谨慎**的判断：
> 
> - **不是**“海峡会长期关闭，世界完了”
> - **也不是**“事情已经解决，马上恢复正常”
> 
> 而是：
> - 海峡会慢慢恢复
> - 但地缘政治风险不会立刻消失
> - 所以能源风险溢价不会一下子完全消退
> 
> 这是一种比较现实的判断。
> 
> ---
> 
> ### 3）“This is why we continue to feel that the curve in crude flattens out...”
> > 这就是为什么我们继续认为原油期货曲线会趋于平坦。你今天可以看到，虽然近月合约跌了15%，但 CLZ6 还是收涨的。这正是我们预期的，而且随着市场逐渐接受这一点，这种走势可能还会继续。
> 
> ### 解读
> 这里讲的是**原油期货曲线（crude curve）**。
> 
> - **front month** = 近月合约，最受短期消息影响
> - **CLZ6** = 某个较远月的原油期货合约（比如 2026 年 12 月）
> 
> “curve flattens out” 指的是：  
> **近月和远月之间的价差缩小，曲线变平。**
> 
> 为什么会这样？
> 
> 因为市场在修正两个极端：
> 
> - 之前：担心海峡封锁，近月油价被炒得很高
> - 现在：发现不会立刻灾难化，近月价格回落
> - 但远期仍然反映：冲突没结束，供应风险还在，油价中枢可能比以前高
> 
> 所以出现：
> - **近月大跌**
> - **远月反而坚挺甚至上涨**
> 
> 作者认为这才是合理定价：  
> **短期最坏情景缓解，但中长期风险仍在。**
> 
> ---
> 
> ### 4）“However, despite the crude oil curve reflecting this view, equities... went a little cuckoo.”
> > 然而，尽管原油曲线已经反映了这种观点，股票市场（像往常一样）却有点发疯了。
> 
> ### 解读
> “went a little cuckoo” 是比较口语化的说法，意思是：  
> **股票市场有点疯、有点失控、反应不理性。**
> 
> 作者认为，商品市场对局势的理解反而更细腻：
> - 短期风险下降
> - 中长期风险仍在
> 
> 但股票市场却简单粗暴地把相关板块全砸了。
> 
> ---
> 
> ### 5）“The aggressive gaps down in petrochemical, fertilizer, tanker and refiner names was grossly overdone...”
> > 石化、化肥、油轮、炼油这些股票的大幅跳空低开，明显跌得太过头了，很可能到本周结束前就会完全收复。
> 
> ### 解读
> 这里作者在说一些**受能源供应链影响的行业股票**跌太多了。
> 
> 这些行业为什么会受影响？
> 
> - **石化**：原料和能源价格变化影响利润
> - **化肥**：天然气、能源价格和农产品价格都相关
> - **油轮**：地缘冲突会影响运价、航线风险、保险成本
> - **炼油**：原油价格和成品油裂解价差影响盈利
> 
> 作者认为，虽然短期“海峡重开”的消息让这些股票下跌，但市场忽略了一个事实：
> 
> > **冲突并没有真正结束，基本面没有发生那么大的变化。**
> 
> 所以他判断这些股票的暴跌可能会很快修复。
> 
> ---
> 
> ### 6）“These names will continue to be volatile on headlines but the fundamental picture has not changed much...”
> > 这些股票还会继续随着新闻标题剧烈波动，但它们的基本面其实并没有发生太大变化，甚至几乎没变。
> 
> ### 解读
> 这是在区分：
> 
> - **headline volatility**：新闻驱动的短期波动
> - **fundamental picture**：真正的基本面
> 
> 作者的意思是：
> - 新闻会让股价一天涨10%、跌10%
> - 但企业盈利逻辑、行业供需、政策方向，并没有因为一天的消息就彻底改变
> 
> 这也是他认为“跌过头”的原因。
> 
> ---
> 
> ### 7）“On the other side, it's interesting to see that the rally in equities held strong.”
> > 另一方面，有意思的是，大盘股票的上涨势头依然很强。
> 
> ### 解读
> 这里说的是**整体股市**，不是能源链条个股。
> 
> 作者觉得，虽然战争新闻很多，但大盘并没有崩，说明市场已经在接受一个判断：
> 
> > **只要霍尔木兹海峡不会长期关闭，经济就不会掉进最坏情景。**
> 
> ---
> 
> ### 8）“equities really just need to be comfortable with the assurance that the strait will reopen...”
> > 对股票来说，真正需要的只是确认：海峡会及时重开，从而避免经济灾难。只要市场对这一点感到安心，股市就还能继续涨。
> 
> ### 解读
> 这是全文另一个关键句。
> 
> 作者认为，**股市最怕的是“长期断供”**，而不是“战争本身”。
> 
> 因为战争本身未必一定打击股市，尤其如果：
> - 经济数据还不错
> - 企业盈利没明显恶化
> - 能源价格虽然高，但没高到摧毁需求
> 
> 那么股市可以继续涨。
> 
> ---
> 
> ### 9）“People are likely confused seeing the headlines... ceasefire was violated... missiles are still flying... That doesn't matter that much for equities.”
> > 人们看到“停火被违反”“导弹还在飞”之类的新闻，可能会很困惑。但这些对股市其实没那么重要。
> 
> ### 解读
> 这句话有点“反直觉”，但作者的逻辑是：
> 
> 股市不是在交易“战争是否完全停止”，而是在交易：
> 
> - 这场冲突会不会演变成全球能源供应灾难？
> - 会不会导致经济衰退？
> - 会不会严重打击企业盈利？
> 
> 如果答案是否定的，那么即使局部冲突还在继续，股市也未必会跌。
> 
> ---
> 
> ### 10）“War happens, it's normally reasonably bullish for stocks over 6 month time periods.”
> > 战争发生后，从6个月的时间尺度看，通常对股票并不一定是坏事，甚至往往偏利多。
> 
> ### 解读
> 这句话不是说“战争是好事”，而是说从历史经验看：
> 
> - 战争不一定长期压垮股市
> - 市场往往会在最初恐慌后重新聚焦：
>   - 财政刺激
>   - 军工支出
>   - 供应链重构
>   - 风险溢价消化后估值修复
> 
> 所以作者强调：  
> **真正的关键不是战争本身，而是战争是否导致长期能源中断。**
> 
> ---
> 
> ### 11）“It's only the strait being closed for an extended period of time that impacts them.”
> > 真正会伤害股市的，只有海峡被长期关闭这种情况。
> 
> ### 解读
> 一句话总结作者对股市的判断：
> 
> > **长期封锁海峡 = 真正系统性风险**  
> > **冲突持续但海峡逐步恢复 = 可控风险**
> 
> ---
> 
> ### 12）“crude oil being at ~90 for the rest of the year instead of 70 is not such a huge deal for stocks.”
> > 如果今年剩下时间油价在90美元左右，而不是70美元，对股市来说其实也没那么严重。
> 
> ### 解读
> 作者认为：
> - 油价高一点会增加成本、压缩利润
> - 但只要不是极端飙升到引发衰退，就不是股市无法承受的事
> 
> 也就是说，**90 美元油价是麻烦，但不是灾难。**
> 
> ---
> 
> ### 13）“the economic data we've gotten over the past two weeks has been pretty much unanimously positive.”
> > 过去两周拿到的经济数据几乎清一色是正面的。
> 
> ### 解读
> 作者提醒大家不要只盯着战争新闻。  
> 现实是：
> - 宏观数据不错
> - 经济基本面暂时没坏
> - 所以股市有支撑
> 
> 这也是为什么他不认同市场过度悲观或过度乐观。
> 
> ---
> 
> ### 14）“we're starting to see some overly optimistic predictions now.”
> > 现在我们开始看到一些过度乐观的预测了。
> 
> ### 解读
> 作者在批评两种极端：
> 
> - 上周：太悲观，觉得要出大事
> - 现在：太乐观，觉得已经没事了
> 
> 他的立场是：
> > 情况确实比 7 天前好，但远远谈不上“彻底安全”。
> 
> 这是一种**务实派**的观点。
> 
> ---
> 
> ### 15）“I'm really liking the energy security basket...”
> > 我很看好我们上一篇文章里提到的“能源安全”组合，并且在寻找买入机会。
> 
> ### 解读
> “energy security basket” 指的是一组受益于欧洲/全球加强能源安全投入的股票组合。
> 
> 逻辑是：
> - 这次危机再次提醒欧洲：能源安全非常脆弱
> - 所以即使短期油价回落，长期政策方向不会变
> - 欧洲仍会继续投钱到：
>   - 生物燃料
>   - 可再生能源
>   - 能源基础设施
>   - 替代能源
> 
> ---
> 
> ### 16）“Verbio... took a -16% day…that seems like a pretty easy buy.”
> > 比如 Verbio（欧洲生物燃料公司）一天跌了16%，这看起来是个很容易的买点。
> 
> ### 解读
> 作者举例说明：  
> 有些股票因为短期情绪被错杀了。
> 
> 他认为 Verbio 这种公司受益于：
> - 欧洲对生物燃料需求增加
> - 能源自主、安全政策强化
> 
> 这些长期逻辑不会因为一天的市场情绪就消失。
> 
> ---
> 
> ### 17）“The absolute worst thing... is changing your view every single day.”
> > 在这种环境里，最糟糕的事情就是每天都改变自己的观点。
> 
> ### 解读
> 这是投资方法论。
> 
> 作者认为，地缘政治行情最容易让人犯错，因为新闻太多、情绪太强。  
> 如果你今天看多、明天看空、后天又追涨杀跌，通常会亏钱。
> 
> 他的建议是：
> 
> - 承认短期不可预测
> - 但对中长期趋势要有稳定框架
> - 不要被每条新闻牵着鼻子走
> 
> ---
> 
> ### 18）“be humble enough to admit you don't know what will happen over the next week...”
> > 要足够谦逊，承认你不知道未来一周会发生什么；但同时对新多极世界下会出现哪些趋势，要有扎实、全面的判断。
> 
> ### 解读
> 这里的“new multipolar world” 指的是**多极化世界**：
> - 美国不再像过去那样单极主导
> - 中东、俄罗斯、中国、欧洲、地区国家之间博弈更复杂
> - 能源、供应链、安全问题会长期成为投资主题
> 
> 作者的意思是：
> - **短期事件不可预测**
> - **长期结构性趋势可以研究**
> 
> ---
> 
> ### 19）“Be chill, don't become a zealot... look for real opportunities.”
> > 保持冷静，不要变成某一种结果的狂热信徒，去寻找真正的机会。
> 
> ### 解读
> 最后一句是全文的投资建议总结：
> 
> - 不要押注极端剧本
> - 不要情绪化
> - 不要因为立场而失去客观判断
> - 要找那些被市场错杀、但长期逻辑没变的资产
> 
> ---
> 
> # 三、这段话的逻辑框架
> 
> 如果把作者的逻辑压缩成一个链条，就是：
> 
> ### 1. 最坏情况缓解了
> 海峡大概率不会长期完全关闭。
> 
> ### 2. 但风险没有消失
> 冲突会拖很久，能源风险溢价不会完全消失。
> 
> ### 3. 所以商品市场的合理反应应该是
> - 近月油价回落
> - 远月油价保持坚挺
> - 原油曲线变平
> 
> ### 4. 股票市场今天有些板块跌过头了
> 尤其是能源链、化肥、油轮、炼油等。
> 
> ### 5. 大盘股反而可以继续稳
> 因为只要没有长期封锁海峡，经济灾难就能避免。
> 
> ### 6. 投资上应该做什么
> - 不要每天改观点
> - 不要追逐新闻
> - 关注长期受益于能源安全、供应链重构的方向
> - 利用市场过度反应找买点
> 
> ---
> 
> # 四、这段话隐含的投资结论
> 
> 作者实际上在表达几个交易观点：
> 
> ## 1. 看空“市场已经完全没事”的想法
> 他不认同“风险彻底解除”。
> 
> ## 2. 看多部分被错杀的能源链股票
> 尤其是：
> - 石化
> - 化肥
> - 油轮
> - 炼油
> - 欧洲能源安全相关标的
> 
> ## 3. 对原油的看法不是极端多头
> 不是说油价会无限涨，而是：
> - 近月恐慌溢价会回吐
> - 但全年油价中枢可能仍偏高
> 
> ## 4. 对大盘股票并不悲观
> 只要海峡不长期关闭，股市可以继续涨。
> 
> ---
> 
> # 五、如果用更通俗的话总结
> 
> 这段话可以翻成一句大白话：
> 
> > 市场前几天太害怕，现在又有点太乐观。更合理的看法是：最坏情况暂时躲过去了，但麻烦还没结束。所以不要因为一天的新闻就把长期逻辑全推翻。真正值得做的是，趁市场情绪过头时，去买那些基本面没坏、只是被错杀的资产。
> 
> ---
> 
> # 六、关键词解释
> 
> ### overreaction
> 过度反应，指价格波动超过基本面变化幅度。
> 
> ### the strait
> 这里大概率指霍尔木兹海峡。
> 
> ### GCC
> 海湾阿拉伯国家合作委员会，通常包括沙特、阿联酋、卡塔尔、科威特、巴林、阿曼。
> 
> ### crude curve flattens
> 原油期货曲线变平，通常意味着短期风险溢价下降，但中长期价格仍有支撑。
> 
> ### front month
> 近月合约。
> 
> ### closed green
> 收涨。
> 
> ### equities went a little cuckoo
> 股票市场有点发疯、反应失常。
> 
> ### gaps down
> 跳空低开。
> 
> ### fundamentals
> 基本面，指供需、盈利、政策、成本等核心因素。
> 
> ### energy security basket
> 能源安全主题投资组合。
> 
> ### multipolar world
> 多极化世界。
> 
> ---
> 
> # 七、作者整体立场一句话概括
> 
> > **作者是一个“谨慎乐观、反对情绪化交易”的立场：不认为危机已经结束，但也不认为会演变成长期灾难，因此主张利用市场过度波动去布局长期受益方向。**
> 
> 如果你愿意，我还可以继续帮你做两件事之一：
> 
> 1. **把这段话翻成更自然的中文全文**  
> 2. **从投资角度提炼成“可执行的交易思路”清单**

</details>

<details>
<summary>After (GPT-5.4 + talk-normal, 1705 chars) — same information, ~1/4 the length, no filler, no "如果你要我还可以...", reads like a human analyst wrote it</summary>

> 这段话的核心判断是：**市场把“海峡很快恢复通行”这件事交易得过头了，但真正更合理的路径是“海峡逐步恢复、冲突持续更久、油价远月更坚挺、相关股票短线错杀后修复”。**
> 
> 分开看：
> 
> 1. **作者对局势的主线判断**
>    - 海峡会恢复通行。
>    - 恢复过程是渐进的。
>    - 中东冲突会持续一段时间，因为伊朗、美国、海湾国家、以色列之间关系很复杂。
>    
>    这意味着作者看的是一种“灾难风险下降，但地缘风险溢价保留”的情景。
> 
> 2. **作者对原油的看法**
>    - 近月油价大跌，说明市场在交易“最坏情况缓解”。
>    - 远月油价依然偏强，说明市场也在接受“风险不会立刻消失”。
>    - 他说的“curve flattens out”指的是原油期限结构趋平：前端回落更快，后端更抗跌。
>    
>    例子里提到 **CLZ6 收涨，而近月跌了15%**，意思就是：短期恐慌溢价在消退，但中长期供应风险仍在。
> 
> 3. **作者对能源链股票的看法**
>    他认为今天这些板块跌得太狠：
>    - 石化
>    - 化肥
>    - 农业
>    - 油轮
>    - 炼油
>    
>    他的逻辑是：
>    - 这些公司真正的基本面没有发生那么大变化；
>    - 市场只是因为“海峡可能恢复”就把它们集体砸下去；
>    - 这种跌幅大概率会在几天内修复。
>    
>    也就是典型的 **headline-driven overreaction（新闻驱动的过度反应）**。
> 
> 4. **作者对大盘股票的看法**
>    他认为股市真正关心的只有一件事：  
>    **海峡能否在足够快的时间内恢复，从而避免全球经济级别的冲击。**
>    
>    只要市场相信这一点：
>    - 即使停火有摩擦
>    - 即使还有导弹和冲突新闻
>    - 即使油价全年维持在90而不是70
>    
>    股票市场依然可以继续涨。  
>    因为对股票来说，关键变量是“是否出现长期能源运输中断导致经济灾难”，只要这个尾部风险下降，股市就能承受战争噪音。
> 
> 5. **作者对宏观背景的补充**
>    - 过去两周经济数据整体偏强。
>    - 大宗商品涨价对经济数据的拖累，短期内还不会特别明显。
>    
>    这给他的风险偏好提供了支撑：  
>    **地缘风险在，宏观数据也还行，所以市场没有必要按衰退或系统性危机去定价。**
> 
> 6. **作者当前最看好的方向**
>    他明确偏好 **energy security basket（能源安全主题）**，也就是：
>    - 生物燃料
>    - 替代能源
>    - 欧洲能源自主相关资产
>    
>    他举的例子是 **Verbio**，一天跌16%，他觉得这是很容易下手的买点。  
>    背后逻辑是：
>    - 欧洲对生物燃料的需求会持续；
>    - 欧洲会更重视能源安全投资；
>    - 这类公司受益于“去脆弱化”和“能源自主”长期趋势。
> 
> 7. **作者真正想表达的交易原则**
>    最重要的一段其实是方法论：
>    - 不要每天跟着新闻改观点；
>    - 短期结果很难预测；
>    - 要抓住更稳定的中期趋势；
>    - 在高波动环境里，最容易犯大错的是情绪化追涨杀跌。
>    
>    他的建议可以概括成：
>    **保持冷静，围绕中期逻辑找错杀机会，而不是被每天的头条牵着走。**
> 
> **这段话的整体立场偏多头，但属于“有条件的多头”**：
> - 看多大盘：因为海峡恢复通行的预期足以支撑风险资产；
> - 看多能源安全主题：因为地缘冲突强化长期投资逻辑；
> - 看多今天被错杀的能源链股票：因为跌幅超过基本面变化；
> - 看多远月油价相对表现：因为冲突拖延会保留风险溢价。
> 
> 你可以把它当成一个交易框架：
> - **短期**：市场对新闻反应过猛，错杀会修复；
> - **中期**：冲突拖延，油价后端偏强；
> - **长期**：能源安全、自主供应链、替代能源受益。
> 
> 实操上，最值得跟踪的是三类信号：**海峡通行进展、原油期限结构变化、能源安全主题股的错杀修复力度。**

</details>

## Usage

### OpenClaw

Three ways, pick whichever fits your workflow:

**Option 1: Paste the GitHub link into chat (easiest)**

Paste this link into your OpenClaw chat and ask it to install:

```
https://github.com/hexiecs/talk-normal
```

**Option 2: ClawHub**

```bash
clawhub install talk-normal && bash skills/talk-normal/install.sh
```

To pull the latest rules later:

```bash
clawhub update talk-normal && bash skills/talk-normal/install.sh
```

**Option 3: Manual git clone**

```bash
git clone https://github.com/hexiecs/talk-normal.git && cd talk-normal && bash install.sh
```

All three paths end up running the same `install.sh`, which auto-detects your `AGENTS.md` and injects the prompt between `# --- talk-normal BEGIN ---` and `# --- talk-normal END ---` markers. The installer is idempotent: re-run it any time to pick up the latest rules without touching the rest of your `AGENTS.md`.

Uninstall:
```bash
bash install.sh --uninstall
```

Start a new conversation to take effect.

### Hermes Agent

Two ways:

**Option 1: Install from GitHub**

```bash
hermes skills install --force hexiecs/talk-normal/hermes
```

> `--force` is required because this skill modifies your `AGENTS.md` to inject always-on prompt rules — Hermes's security scanner flags that as persistent prompt modification. The skill is open-source; review it at [`hermes/SKILL.md`](hermes/SKILL.md) before installing.

Then run the installer in your project directory:

```bash
bash ~/.hermes/skills/talk-normal/install.sh
```

**Option 2: Manual git clone**

```bash
git clone https://github.com/hexiecs/talk-normal.git && cd talk-normal && bash install.sh
```

The installer auto-detects your workspace config file (`.hermes.md`, `HERMES.md`, or `AGENTS.md`) and injects the rules. Hermes freezes context files at session start, so start a new session to take effect.

Uninstall:
```bash
bash install.sh --uninstall
```

### ChatGPT custom instructions

Copy the contents of [`prompt-chatgpt.md`](prompt-chatgpt.md) into ChatGPT's [custom instructions](https://chatgpt.com/#settings/Personalization) field.

ChatGPT's custom instructions fields are capped at 1500 characters each. `prompt-chatgpt.md` is a compressed variant built to fit that limit while preserving every load-bearing rule from `prompt.md` (negation-frame ban, closing-stamp ban, filler list, conditional-menu ban, few-shot BAD/GOOD examples). Use `prompt.md` everywhere there is no length cap (OpenClaw, API, Cursor, Continue); use `prompt-chatgpt.md` only for the ChatGPT custom instructions field.

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

### GPT-4o-mini — average reduction: 73%

| # | Prompt | Original | talk-normal | Reduction |
|---|--------|----------|-----------|-----------|
| 1 | TCP vs UDP? | 2488 | 630 | 74% |
| 2 | What is Python? | 1583 | 513 | 67% |
| 3 | Explain how HTTP works | 3526 | 875 | 75% |
| 4 | How does DNS work? | 3263 | 1100 | 66% |
| 5 | Is React better than Vue? | 2389 | 249 | 89% |
| 6 | Docker和虚拟机有什么区别? | 901 | 297 | 67% |
| 7 | 什么是机器学习? | 551 | 125 | 77% |
| 8 | 什么是区块链? | 469 | 115 | 75% |
| 9 | Redis和Memcached哪个好? | 810 | 129 | 84% |
| 10 | Microservices pros/cons | 3027 | 922 | 69% |

### GPT-5.4 — average reduction: 72%

| # | Prompt | Original | talk-normal | Reduction |
|---|--------|----------|-----------|-----------|
| 1 | TCP vs UDP? | 1076 | 515 | 52% |
| 2 | What is Python? | 628 | 502 | 20% |
| 3 | Explain how HTTP works | 5761 | 954 | 83% |
| 4 | How does DNS work? | 3383 | 731 | 78% |
| 5 | Is React better than Vue? | 1214 | 466 | 61% |
| 6 | Docker和虚拟机有什么区别? | 1999 | 514 | 74% |
| 7 | 什么是机器学习? | 767 | 195 | 74% |
| 8 | 什么是区块链? | 852 | 391 | 54% |
| 9 | Redis和Memcached哪个好? | 1629 | 252 | 84% |
| 10 | Microservices pros/cons | 3489 | 1288 | 63% |

GPT-5.4 is already more concise than 4o-mini out of the box. talk-normal still cuts verbose responses by 20-89% on both models.

## Rule iteration

Individual rules are iterated against real LLM output. Each rule that leaks in production gets a file in [regressions/](regressions/) tracking the leak count per version, the specific fix, and the observed LLM excerpts that motivated each round.

Example: the `"不是X，而是Y"` rhetorical frame went from 6 violations per response to 0 across four iterations on the same stress prompt. The load-bearing change turned out to be removing a specific negative example from the rule text — it was being copied verbatim by the model as a template instead of avoided as an anti-pattern. Full writeup: [regressions/rule-17-negation-frame.md](regressions/rule-17-negation-frame.md).

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=hexiecs/talk-normal&type=Date)](https://star-history.com/#hexiecs/talk-normal&Date)

## License

MIT
