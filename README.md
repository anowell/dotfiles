dotfiles
--------

...cuz configuration like this should take seconds, not hours...

### prereqs

    colordiff     # because color...
    rbenv         # sane management of ruby versions
    oh-my-zsh     # installed to ~/.oh-my-zsh


### usage

    bundle install --binstubs
    bin/rake -T               # show available commands

    bin/rake diff             # view the difference between config files in use and this repo
    bin/rake install          # install all configuration files specified in manifest.yaml
    bin/rake backup           # backup configuration files in use into this repo

After zsh config is installed, `bin/rake` can be shortened to just `rake` - as it should be.

### and then...

    make more awesome configuration, and add it to `manifest.yaml`
