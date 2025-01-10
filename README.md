# Dotfiles

## Requirements
- GNU Stow (`brew install stow`)


# Usage

### ZSH 
Check the installation requirements in [ZSH](./zsh/README.md)
```shell
stow zsh --adopt
git restore zsh
source ~/.zshrc
```

Will create the symb link adopting whatever is already in the default and then git restore to use the intended config (from git).
This works becase once the symb link is created, restoring the file to default will take effect in the one on `$HOME`.

### Other configs
```shell
stow nvim
stow alacritty
stow tmux
stow starship
stow bat
stow ghostty
stow aerospace
```
