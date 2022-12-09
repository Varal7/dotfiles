#!/bin/bash

# Needs to manually install:
# zsh, tmux, git, hub, nvim, brew (if mac), ripgrep, python, stow, fzf

# On mac:
# https://github.com/dshnkao/SpaceId
# https://github.com/koekeishiya/yabai
# https://github.com/koekeishiya/skhd
# https://sw.kovidgoyal.net/kitty/binary/

# Do this so stow doesn't do random stuff
mkdir -p ~/.config/coc
touch  ~/.config/coc/commands

stow zsh
stow tmux
stow git
stow python
stow nvim
stow personal

if [ "$(uname)" == "Darwin" ]; then
  stow skhd
  stow yabai
  stow kitty
fi

# Install vim plugins
nvim -c 'PlugInstall' -c 'qa!'

# Install zsh extensions

mkdir -p "$HOME/.zsh"
# spaceship
if [ ! -d "$HOME/.zsh/spaceship" ] ; then
  git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"
fi
# z for jump
if [ ! -a "$HOME/.zsh/z.sh" ] ; then
  wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O "$HOME/.zsh/z.sh"
fi
# zsh-nvm
if [ ! -d "$HOME/.zsh/zsh-nvm" ] ; then
  git clone https://github.com/lukechilds/zsh-nvm.git "$HOME/.zsh/zsh-nvm"
fi
# zsh syntax highlighting
if [ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ] ; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"
fi
# completions
if [ ! -d "$HOME/.zsh/zsh-completions" ] ; then
  git clone https://github.com/zsh-users/zsh-completions.git "$HOME/.zsh/zsh-completions"
fi
if [ ! -d "$HOME/.zsh/spaceship-vi-mode" ] ; then
  git clone https://github.com/spaceship-prompt/spaceship-vi-mode.git "$HOME/.zsh/spaceship-vi-mode"
fi
