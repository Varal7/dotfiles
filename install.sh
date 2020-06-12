#!/bin/bash

# Needs to manually install:
# zsh, oh-my-zsh, tmux, git, hub, nvim, brew (if mac)
# oh-my-zsh : https://github.com/robbyrussell/oh-my-zsh
# spaceship-prompt: https://github.com/denysdovhan/spaceship-prompt


# Symlink dotfiles
RLINK="readlink"

if  [ "$(uname)" == "Darwin" ]; then

  # symlink nvim
  if  ! [ -x "$(command -v greadlink)" ]; then
        # Requires brew install coreutils
        echo "You need to install coreutils first"
        echo "brew install coreutils"
  fi

  RLINK="greadlink"
  ./wm.sh
  ln -sf $($RLINK -f skhdrc) $HOME/.skhdrc
fi

ln -sf $($RLINK -f vimrc) $HOME/.vimrc
ln -sf $($RLINK -f zshrc) $HOME/.zshrc
ln -sf $($RLINK -f gitconfig) $HOME/.gitconfig
ln -sf $($RLINK -f gitattributes_global) $HOME/.gitattributes_global
ln -sf $($RLINK -f tmux.conf) $HOME/.tmux.conf
ln -sf $($RLINK -f pylintrc) $HOME/.pylintrc
ln -sf $($RLINK -f pycodestyle) $HOME/.config/pycodestyle

# symlink nvim
if  [ -x "$(command -v nvim)" ]; then
	mkdir -p $HOME/.config/nvim/
	ln -sf $($RLINK -f vimrc) $HOME/.config/nvim/init.vim
fi

# Install vim plugins

vim -c 'PlugInstall' -c 'qa!'
