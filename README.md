dotfiles
--------

...cuz configuration like this should take seconds, not hours...

### prereqs

    colordiff                 # (PAC) because color...
    xsel                      # (PAC) for pbcopy/pbpaste aliases
    zsh-syntax-highlighting   # (PAC) it's awesome and in the arch community repo
    rbenv                     # (AUR) sane management of ruby versions
    sublime-text-dev          # (AUR) for SublimeText 3 configuration
    oh-my-zsh                 # (GIT) installed to ~/.oh-my-zsh

I've listed Arch-specific packages, but it should be easy enough to find the equivalent for other distros
-  PAC: Package name in Arch Repos
-  AUR: Package name in the Arch User Repository
-  GIT: Installed straight from Github

### usage

    bundle install --binstubs
    bin/rake -T               # show available commands

    bin/rake diff             # view the difference between config files in use and this repo
    bin/rake install          # install all configuration files specified in manifest.yaml
    bin/rake backup           # backup configuration files in use into this repo

After zsh config is installed, `bin/rake` can be shortened to just `rake` - as it should be.

### and then...

    make more awesome configuration, and add it to `manifest.yaml`
