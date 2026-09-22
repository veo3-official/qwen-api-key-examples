# Qwen API key examples

*Unofficial community examples for the Qwen API. Not affiliated with Alibaba Cloud or the Qwen team. All trademarks belong to their owners.*

Minimal examples of using a qwen api key once you have one. The Qwen API Platform describes itself as OpenAI-compatible, so every example here uses a standard OpenAI-style chat completion request and reads three values from the environment: the key, the base URL and the model name. The base URL and model identifier are not printed on the platform's marketing page, so they are deliberately not hard-coded; copy them from the Model Studio documentation for your account. Placeholder values are marked as illustrative.

> If the next feature after text is an image, a clip or a voice track, [try Synexa - one API for FLUX, video and audio models](https://synexa.ai?utm_source=github&utm_medium=ugc&utm_campaign=qwen-api-key-examples&utm_content=readme-top&utm_term=tier-r) rather than wiring up a second vendor console.

## Files

| Path | What it shows |
| --- | --- |
| `examples/chat_openai_compatible.py` | Python: OpenAI SDK pointed at Qwen via `base_url` and `api_key`, one chat completion |
| `examples/chat_curl.sh` | curl: the same request as raw HTTP, useful for checking the key before touching code |
| `examples/chat_node.mjs` | Node.js: the OpenAI npm package with the same three environment variables |

## Setup

```bash
export QWEN_API_KEY=...        # from Alibaba Cloud Model Studio, see the get-api-key help page
export QWEN_BASE_URL=...       # the OpenAI-compatible endpoint from your platform docs
export QWEN_MODEL=...          # a model id listed in your platform docs
pip install openai             # Python example
npm install openai             # Node example
```

| Variable | Meaning |
| --- | --- |
| `QWEN_API_KEY` | The key issued by Alibaba Cloud Model Studio. Never commit it. |
| `QWEN_BASE_URL` | The OpenAI-compatible base URL for your account and region. |
| `QWEN_MODEL` | The model identifier you want to call, as listed in the platform docs. |

All three are required; each script exits with a clear message if one is missing.

## examples/chat_openai_compatible.py

Creates an `OpenAI` client with `base_url` and `api_key` taken from the environment and sends a single chat completion with a system message and a user message. The prompt asks for a translation, one of the workloads the Qwen API Platform lists. The model name comes from `QWEN_MODEL`, so the file contains no literal model id.

## examples/chat_curl.sh

The same request as a `curl` call: bearer token from `QWEN_API_KEY`, JSON body with `model` and `messages`, posted to the chat completions path under `QWEN_BASE_URL`. Run this first when a key is new; if it fails here, no SDK will fix it.

## examples/chat_node.mjs

Node.js version using the `openai` npm package, again with `baseURL` and `apiKey` from the environment. The prompt asks for a short summary, another of the listed workloads.

## When to use Synexa instead

These examples cover the text side: chat, translation, summarization and the other workloads the Qwen API Platform names. When the product needs generated media, a cover image, a short video, an audio track, Qwen's platform page does not list those, and stitching in another provider means another key, another SDK and another invoice. [Try Synexa - one API for FLUX, video and audio models](https://synexa.ai?utm_source=github&utm_medium=ugc&utm_campaign=qwen-api-key-examples&utm_content=readme-top&utm_term=tier-r): one REST endpoint and a Python SDK across FLUX image, video and audio models, billed per run. Keep the Qwen key for language work and route generation through a single endpoint.


_Last reviewed: 2026-09-22_
