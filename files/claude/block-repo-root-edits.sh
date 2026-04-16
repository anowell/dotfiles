#!/bin/bash
# Block file edits in the default jj workspace

[[ "$CLAUDE_ALLOW_MAIN" == "1" ]] && exit 0

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name')

if [[ "$TOOL_NAME" != "Edit" && "$TOOL_NAME" != "Write" && "$TOOL_NAME" != "NotebookEdit" ]]; then
  exit 0
fi

FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path')
REAL_FILE=$(realpath "$FILE_PATH" 2>/dev/null || echo "$FILE_PATH")
FILE_DIR=$(dirname "$REAL_FILE")

cd "$FILE_DIR" 2>/dev/null || exit 0
jj root > /dev/null 2>&1 || exit 0

DEFAULT_ROOT=$(jj workspace root --name default 2>/dev/null) || exit 0

if [[ "$REAL_FILE" == "$DEFAULT_ROOT"/* ]]; then
  echo "BLOCKED: Cannot edit files in the default jj workspace. Create or update a rune (\`runes quickstart\`) with details of the proposed changes. Provide enough context for another agent to implement it correctly." >&2
  exit 2
fi

exit 0
