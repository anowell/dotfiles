dotfiles
--------

...cuz configuration like this should take seconds, not hours...

### Install

Install `colordiff` (required by `dotfiles diff`) and build or install dotfiles with `cargo`.

```
cargo install --git https://github.com/anowell/dotfiles
```

### My dotfile configuration

Installing dotfiles does not install my personal config files.
Dotfiles reads `manifest.toml` in the working directory which specifies which config files it manages.
To use my config, clone this repo and run dotfiles within the repo root.

My dotfile configuration assumes other components:

    xsel                      # (zsh) for pbcopy/pbpaste aliases
    zsh-syntax-highlighting   # (zsh)
    visual-studio-code        # (vscode) for VS Code configuration
    zoxide                    # (zsh) for z helper

### Usage

```
$ dotfiles -h             # Prints dotfiles help
$ dotfiles                # Shows which apps managed by dotfiles (based on manifest.toml)

$ dotfiles backup         # Backup all dotfiles
$ dotfiles diff           # Diff all dotfiles
$ dotfiles install        # install all dotfiles

$ dotfiles backup tmux    # Backup local tmux into dotfiles repo
$ dotfiles diff vim       # Diff dotfiles repo with local config for vim
$ dotfiles install zsh    # Configure zsh from dotfiles repo
```

### and then...

make more awesome configuration, and add it to `manifest.toml`
