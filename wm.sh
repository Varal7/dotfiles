#!/bin/bash

# install chunkwm
if  ! [ -x "$(command -v chunkwm)" ]; then
  brew tap koekeishiya/formulae
  brew install chunkwm
  cp /usr/local/opt/chunkwm/share/chunkwm/examples/chunkwmrc ~/.chunkwmrc
fi

# install skhd
if  ! [ -x "$(command -v skhd)" ]; then
  brew tap koekeishiya/formulae
  brew install skhd
fi
