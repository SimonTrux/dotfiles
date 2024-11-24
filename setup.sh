#!/bin/bash

Help() {
   echo "This script symlinks files in ./conf. You get : "
	 echo " - Improved vim, tmux, git alias, a cleaner bash, a better cat (bat) "
	 echo "   and fzf to find and prewiew anything with C-t or cmd **TAB "
	 echo "You need to have ~/.bashrc.d/ sourced in your ~/.bashrc for this config to work."
	 echo
   echo "Usage : ./setup.sh [-h -i -f]"
   echo "Options"
   echo "  -h  : Display this help "
	 echo "  -i  : Run install_packages.sh script beforehand."
   echo "  -f  : Force symlinking by overwrite present files. Use with caution."
 }

# import echolor function that show OK or KO depending on return code of previous command.
 source scripts/echolor.sh

# if more than 0 args and 1st arg isnt an option (doesn't start with "-"), exit
if [[ $# -gt 0 && ! $1 =~ ^(-) ]]
then
  echolor "Error: Unexpected argument."
  Help
  exit 1
fi

# Variable sections
CONF_PATH="${PWD}/conf"
OPTIONS=":ihf"

# Options handling
while getopts ${OPTIONS} option; do
   case $option in
      h)  # display Help
         Help
         exit;;
      i)  # run install_pkgs.sh
         ./scripts/install_pkgs.sh ;;
      f)  # force symlinking
         OPTS="-f";;
      ?) # Invalid option
         echo "Error: Invalid option"
         Help
         exit 1 ;;
   esac
done

## .bashrc Setup
mkdir -p ~/.bashrc.d

# Ensure ~/.bashrc sources ~/.bashrc.d
if ! grep -q 'if \[ -d ~/.bashrc.d \]; then' ~/.bashrc; then
    cat << 'EOF' >> ~/.bashrc

# Source scripts from ~/.bashrc.d if it exists
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

EOF
fi

echolor "Creating ~/.bashrc.d dir and ensuring it is sourced by ~/.bashrc.\n"


echo -e "Symlinking .vimrc .tmux.conf .gitconfig, own_bashrc and own_aliases."
info "You can live edit files in ./conf and reload with so    (source ~/.bashrc)\n"

#set -x
ln -s $OPTS ${CONF_PATH}/vimrc ~/.vimrc
ln -s $OPTS ${CONF_PATH}/tmux.conf ~/.tmux.conf
ln -s $OPTS ${CONF_PATH}/gitconfig ~/.gitconfig
ln -s $OPTS ${CONF_PATH}/own_bashrc ~/.bashrc.d/own_bashrc
ln -s $OPTS ${CONF_PATH}/own_aliases ~/.bashrc.d/own_aliases
# TODO wrap last 5 command, and if one fails, display a message suggesting
# tu run again with -f

echo

## VIM THEME ##
# vim -c 'PlugInstall' -c 'qa!'
mkdir -p ~/.vim
cp -r --update -v ${CONF_PATH}/dot_vim/* ~/.vim/
echolor "Installing vim customized palenight theme with lightline.\n"


# From https://github.com/catppuccin/gnome-terminal
#curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.3.0/install.py | python3 - 
if command -v python3 > /dev/null 2>&1 && command -v gnome-terminal > /dev/null 2>&1
	then python3 scripts/install_gnome-terminal_theme.py --local scripts/Catppuccin_palette.json > /dev/null
  echolor "Installing catppuccin themes for gnome-terminal."
  info "In Gnome Terminal, open Edit -> Preferences, and enable the profile for the theme you want. MOCHA !\n"
fi


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
  echolor "Installing catppuccin themes for bat.\n"
fi


# Sourcing the bashrc
source ~/.bashrc
echolor "Sourcing ~/.bashrc\n"


