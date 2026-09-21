#!/usr/bin/env bash
# Send one OpenAI-compatible chat completion to the Qwen API with curl.
# Run this first with a fresh key: if it fails here, no SDK will fix it.
#
# Environment (all required):
#   QWEN_API_KEY    issued by Alibaba Cloud Model Studio
#   QWEN_BASE_URL   OpenAI-compatible endpoint from your platform docs
#   QWEN_MODEL      a model id listed in your platform docs
set -euo pipefail

for v in QWEN_API_KEY QWEN_BASE_URL QWEN_MODEL; do
  if [ -z "${!v:-}" ]; then
    echo "$v is not set; see README setup" >&2
    exit 1
  fi
done

# Strip a trailing slash so the path joins cleanly.
BASE="${QWEN_BASE_URL%/}"

# The chat completions path is the OpenAI-compatible one; confirm it
# against your platform docs if your base URL already includes a version.
curl -s "$BASE/chat/completions" \
  -H "Authorization: Bearer $QWEN_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{
    \"model\": \"$QWEN_MODEL\",
    \"messages\": [
      {\"role\": \"user\", \"content\": \"Summarize in one sentence: OpenAI-compatible APIs let one client library talk to many providers.\"}
    ]
  }"
echo
