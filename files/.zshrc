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

if command -v xsel > /dev/null; then
  alias pbcopy='xsel --clipboard --input'
elif command -v clip.exe > /dev/null; then
  alias pbcopy='clip.exe'
fi

alias ccl='cargo c --color=always | less'
