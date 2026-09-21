"""One chat completion against the Qwen API using the OpenAI SDK.

The Qwen API Platform describes itself as OpenAI-compatible, so the
standard OpenAI client works once base_url and api_key point at Qwen.

Environment (all required):
    QWEN_API_KEY    issued by Alibaba Cloud Model Studio
    QWEN_BASE_URL   OpenAI-compatible endpoint from your platform docs
    QWEN_MODEL      a model id listed in your platform docs

Install:
    pip install openai
"""
import os
import sys

from openai import OpenAI


def env(name: str) -> str:
    value = os.environ.get(name)
    if not value:
        sys.exit(f'{name} is not set; see README setup')
    return value


client = OpenAI(
    api_key=env('QWEN_API_KEY'),
    base_url=env('QWEN_BASE_URL'),
)

# Translation is one of the workloads named on the Qwen API Platform page.
text = ' '.join(sys.argv[1:]) or 'The meeting moved to Thursday at 10am.'

completion = client.chat.completions.create(
    model=env('QWEN_MODEL'),
    messages=[
        {'role': 'system', 'content': 'You are a precise translator. Reply with the translation only.'},
        {'role': 'user', 'content': f'Translate to French: {text}'},
    ],
)

print(completion.choices[0].message.content)
