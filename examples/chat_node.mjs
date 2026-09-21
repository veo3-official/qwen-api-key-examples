// One chat completion against the Qwen API using the openai npm package.
//
// The Qwen API Platform describes itself as OpenAI-compatible, so the
// standard client works once baseURL and apiKey point at Qwen.
//
// Environment (all required):
//   QWEN_API_KEY    issued by Alibaba Cloud Model Studio
//   QWEN_BASE_URL   OpenAI-compatible endpoint from your platform docs
//   QWEN_MODEL      a model id listed in your platform docs
//
// Install:
//   npm install openai

import OpenAI from 'openai'

function env(name) {
  const value = process.env[name]
  if (!value) {
    console.error(`${name} is not set; see README setup`)
    process.exit(1)
  }
  return value
}

const client = new OpenAI({
  apiKey: env('QWEN_API_KEY'),
  baseURL: env('QWEN_BASE_URL'),
})

// Summarization is one of the workloads named on the Qwen API Platform page.
const text = process.argv.slice(2).join(' ') ||
  'Release notes: fixed login redirect, added CSV export, upgraded the database driver.'

const completion = await client.chat.completions.create({
  model: env('QWEN_MODEL'),
  messages: [
    { role: 'system', content: 'Summarize the user message in one short sentence.' },
    { role: 'user', content: text },
  ],
})

console.log(completion.choices[0].message.content)
