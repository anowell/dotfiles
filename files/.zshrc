# Path to your oh-my-zsh installation.

export ZSH=/usr/share/oh-my-zsh
export ZSH_CUSTOM=~/.zsh.d
ZSH_THEME="anowell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git cargo docker aws)

source $ZSH/oh-my-zsh.sh

for file in ~/.zsh.d/* ; do
  if [ -f "$file" ] ; then
    . "$file"
  fi
done

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(rbenv init -)"

export EDITOR=vim
export PATH=bin:$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

export fpath=(/home/anowell/proj/algorithmia-cli/completions/zsh $fpath)
autoload -U compinit
compinit

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias pbclear='xsel --clipboard --clear'

alias lpp='lpass show --password -c'
alias lpu='lpass show --username -c'
alias lpls='lpass ls'
alias lpgrep='lpass ls | grep -i'

alias ccat='source-highlight --out-format=esc -o STDOUT -i'
alias ccl='cargo c --color=always 2>&1 | less'
