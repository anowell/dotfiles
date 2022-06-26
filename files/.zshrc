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

export EDITOR=vim
export PATH=bin:$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$PATH
export HISTFILE=$HOME/.zhistory
export SAVEHIST=2000

alias pbcopy='xsel --clipboard --input'
alias ccl='cargo c --color=always | less'
