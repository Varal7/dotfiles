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
	ln -sf $($RLINK -f coc-settings.json) $HOME/.config/nvim/
fi

# Install vim plugins

vim -c 'PlugInstall' -c 'qa!'

# Install zsh extensions

## Spaceship

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Zsh completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

