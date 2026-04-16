#!/bin/bash
COMMAND=$(jq -r '.tool_input.command // empty')

if echo "$COMMAND" | grep -qE '^\s*git(\s|$)'; then
  echo "Use jujutsu (jj) instead" >&2
  exit 2
fi
