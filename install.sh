#!/bin/bash

# Needs to manually install:
# zsh, oh-my-zsh, tmux, git, hub, nvim, brew (if mac), ripgrep, node, python, stow
# oh-my-zsh : https://github.com/robbyrussell/oh-my-zsh
# spaceship-prompt: https://github.com/denysdovhan/spaceship-prompt

# On mac:
# https://github.com/dshnkao/SpaceId
# https://github.com/koekeishiya/yabai
# https://github.com/koekeishiya/skhd
# https://sw.kovidgoyal.net/kitty/binary/

stow zsh
stow tmux
stow git
stow python
stow nvim
stow personal

if  [ "$(uname)" == "Darwin" ]; then
  stow skhd
  stow yabai
  stow kitty
fi

# Install vim plugins
nvim -c 'PlugInstall' -c 'qa!'

# Install zsh extensions

mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O "$HOME/.zsh/z.sh"


# ## Spaceship
# git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt --depth=2
# ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme

# # Zsh syntax highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# # Zsh completions
# git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# # Zsh nvm
# git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-nvm
