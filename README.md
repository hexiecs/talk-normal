# normal-gpt

Make GPT talk like a normal person. No filler, no fluff, just the answer.

## What it does

A single system prompt that transforms GPT's verbose, corporate-sounding output into direct, informative responses. Tested on GPT-4o-mini (**71% reduction**) and GPT-5.4 (**56% reduction**) while preserving all useful information. [See full comparison with all 10 test questions and complete answers](TEST_RESULTS.md).

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
