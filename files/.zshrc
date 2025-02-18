if [ ~/.zsh.d/.(NF) ]; then
  for file in ~/.zsh.d/* ; do
    if [ -f "$file" ] ; then
      . "$file"
    fi
  done
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  # Ubuntu
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  # Arch
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export EDITOR=/usr/bin/helix
export PATH=bin:$HOME/.cargo/bin:$HOME/go/bin:$HOME/bin:/usr/local/go/bin:/usr/local/bin:$PATH
export HISTFILE=$HOME/.zhistory
export SAVEHIST=2000
# export DOCKER_HOST=unix:///run/podman/podman.sock


# Disable XON/OFF (Ctrl-S pause, Ctrl-Q resume)
stty -ixon

# Fix history search in tmux
bindkey -v
bindkey '^R' history-incremental-search-backward

alias pbcopy='xsel --clipboard --input'
alias ccl='cargo c --color=always | less'
alias open='xdg-open'
alias xhjwt="xh -A bearer -a $JWT_TOKEN"
alias hx='helix'
alias zed='zeditor'
alias trimfile="sed -i 's/[[:space:]]*$//'"
alias sde="source .env"
