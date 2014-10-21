# ------------------------------------------------------------------------------
#          FILE:  anowell.zsh-theme
#   DESCRIPTION:  oh-my-zsh theme file.
#        AUTHOR:  Anthony Nowell (anowell@gmail.com)
#       VERSION:  1.0.0
#    SCREENSHOT:
# ------------------------------------------------------------------------------

prompt_context() {
  local user=`whoami`

  if [[ $UID -eq 0 || -n "$SSH_CLIENT" ]]; then
    if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
      local cc="cyan" && [[ $UID -eq 0 ]] && local cc="red"
      echo -n ":%{$fg[$cc]%}$user@%m%{$reset_color%}"
    else
      echo -n ":$user@%m"
    fi
  fi
}

prompt_symbol() {
  if [[ $UID -eq 0 ]]; then
    echo -n "#"
  else
    echo -n "$"
  fi
}

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
    ZSH_THEME_GIT_PROMPT_PREFIX=":%{$fg[blue]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    PROMPT='%{$fg[yellow]%}%T%{$reset_color%}$(prompt_context):%{$fg[green]%}%~%{$reset_color%}$(git_prompt_info)%(?.%{$fg[green]%}.:%{$fg[red]%}%?)$(prompt_symbol)%{$reset_color%} '

else
    ZSH_THEME_GIT_PROMPT_PREFIX=":"
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY="!"
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    PROMPT='%T%$(prompt_context):%~$(git_prompt_info)%(?..:%?)$(prompt_symbol) '
fi
