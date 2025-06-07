#!/bin/bash

source scripts/func/echolor.sh

CONF_PATH=$1

## VIM THEME ##
# vim -c 'PlugInstall' -c 'qa!'
mkdir -p ~/.vim
cp -r --update ${CONF_PATH}/dot_vim/* ~/.vim/
echolor "Installing vim customized palenight theme with lightline."


## Bat theme config part
if command -v bat > /dev/null 2>&1
	then BAT_BIN="bat"
elif command -v batcat > /dev/null 2>&1
	then BAT_BIN="batcat"
fi

if command -v $BAT_BIN > /dev/null 2>&1 ; then
  mkdir -p ~/.config/bat/themes
  cp -r --update -v ${CONF_PATH}/themes/bat_Catppuccin_Mocha.tmTheme ~/.config/bat/themes/bat_Catppuccin_Mocha.tmTheme
  $BAT_BIN cache --build > /dev/null
  echolor "Installing catppuccin themes for bat."
fi


## Gnome-terminal Theme
# From https://github.com/catppuccin/gnome-terminal
#curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.3.0/install.py | python3 - 
if command -v python3 > /dev/null 2>&1 && command -v gnome-terminal > /dev/null 2>&1
	then python3 scripts/install_gnome-terminal_theme.py --local scripts/Catppuccin_palette.json > /dev/null
  echolor "Installing catppuccin themes for gnome-terminal."
  info "In Gnome Terminal, open Edit -> Preferences, and enable the profile for the theme you want. MOCHA !\n"
fi
