dotfiles
--------

...cuz configuration like this should take seconds, not hours...

### prereqs

Running the rake tasks really only depends on `rake` and `colordiff`

The rake task installs configuration that expects several other components

    xsel                      # (zsh) for pbcopy/pbpaste aliases
    rbenv                     # (zsh) for sane ruby version management
    zsh-syntax-highlighting   # (zsh) it's awesome and in the arch community repo
    sublime-text-dev          # (sublime) for SublimeText 3 configuration
    oh-my-zsh                 # (zsh) installed to ~/.oh-my-zsh directly from github
    lpass                     # (zsh) command line access to lastpass aliased to lpp and lpu

### usage

    $ rake -T
    rake backup           # backup all dotfiles
    rake backup:sublime   # Backup local sublime into dotfiles repo
    rake backup:tmux      # Backup local tmux into dotfiles repo
    rake backup:vim       # Backup local vim into dotfiles repo
    rake backup:zsh       # Backup local zsh into dotfiles repo
    rake diff             # diff all dotfiles
    rake diff:sublime     # Diff dotfiles repo with local config for sublime
    rake diff:tmux        # Diff dotfiles repo with local config for tmux
    rake diff:vim         # Diff dotfiles repo with local config for vim
    rake diff:zsh         # Diff dotfiles repo with local config for zsh
    rake install          # install all dotfiles
    rake install:sublime  # Configure sublime from dotfiles repo
    rake install:tmux     # Configure tmux from dotfiles repo
    rake install:vim      # Configure vim from dotfiles repo
    rake install:zsh      # Configure zsh from dotfiles repo

### and then...

    make more awesome configuration, and add it to `manifest.yaml`
