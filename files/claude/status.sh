#!/usr/bin/env bash
set -euo pipefail

# Read JSON input from Claude
input="$(cat)"

# === ANSI color codes ===
BOLD="\033[1m"
DIM="\033[2m"
BLUE="\033[38;5;117m"
YELLOW="\033[38;5;226m"
PURPLE="\033[38;5;135m"
RED="\033[38;5;196m"
RESET="\033[0m"


# JJ change (bold purple)
jj_change=""
if jj log --no-graph -r=@ -T='change_id' >/dev/null 2>&1; then
  change_out=$(jj log --no-graph -r=@ -T='separate(" ", working_copies, change_id.shortest(), bookmarks,)')
  if [ -n "$change_out" ]; then
    jj_change="on ${BOLD}${PURPLE}$change_out${RESET}"
  fi
fi


get_model_name() { echo "$input" | jq -r '.model.display_name'; }
get_current_dir() { echo "$input" | jq -r '.workspace.current_dir'; }
get_project_dir() { echo "$input" | jq -r '.workspace.project_dir'; }
get_version() { echo "$input" | jq -r '.version'; }
get_cost() { echo "$input" | jq -r '.cost.total_cost_usd'; }
get_duration() { echo "$input" | jq -r '.cost.total_api_duration_ms'; }
get_lines_added() { echo "$input" | jq -r '.cost.total_lines_added'; }
get_lines_removed() { echo "$input" | jq -r '.cost.total_lines_removed'; }
get_input_tokens() { echo "$input" | jq -r '.context_window.total_input_tokens'; }
get_output_tokens() { echo "$input" | jq -r '.context_window.total_output_tokens'; }
get_context_window_size() { echo "$input" | jq -r '.context_window.context_window_size'; }
get_context_window_usage() { echo "$input" | jq -r '.context_window.used_percentage'; }

if jj workspace root >/dev/null 2>&1; then
  proj_name=$(basename "$(jj workspace root)")
else
  proj_name=$(basename "$(get_project_dir)")
fi


time_display="${YELLOW}[$(date '+%H:%M')]${RESET}"
proj_display="${BOLD}${BLUE}${proj_name}${RESET}"
ctx_display="${DIM}$(get_context_window_usage)% context${RESET}"
cost_display="${RED}\$$(printf '%.2f' "$(get_cost)")${RESET}"

duration_ms=$(get_duration)
duration_sec=$((duration_ms / 1000))
if [ "$duration_sec" -ge 3600 ]; then
  duration_display="${YELLOW}$((duration_sec / 3600))h${RESET}"
elif [ "$duration_sec" -ge 60 ]; then
  duration_display="${YELLOW}$((duration_sec / 60))m${RESET}"
else
  duration_display="${YELLOW}${duration_sec}s${RESET}"
fi

# === Compose final status line ===
echo -e "${time_display} ${proj_display} ${jj_change} (${ctx_display}) ${cost_display} ${duration_display}"


