#!/bin/bash
INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // empty')
DIR_BASENAME=$(basename "$CWD")

# Combine all relevant tool input fields to check
CHECK=$(echo "$INPUT" | jq -r '
  [.tool_input.command, .tool_input.file_path, .tool_input.pattern, .tool_input.path, .tool_input.glob]
  | map(select(. != null))
  | join("\n")
')

# Does it reference .env at all?
if ! echo "$CHECK" | grep -qE '\.env'; then
  exit 0
fi

# Allow safe patterns like .env.example, .env.sample, .env.template
FILTERED=$(echo "$CHECK" | sed -E 's/\.env\.(example|sample|template)//g')
if ! echo "$FILTERED" | grep -qE '\.env'; then
  exit 0
fi

# Block and notify
osascript -e "display notification \"Claude attempted to access .env in $DIR_BASENAME\" with title \"Agent Overreach\"" &
echo "Do NOT attempt to read secrets from .env" >&2
exit 2
