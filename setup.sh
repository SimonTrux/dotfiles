#!/bin/bash

Help() {
   echo "This script symlinks files in ./conf. You get : "
	 echo " - Improved vim, tmux, git alias, a cleaner bash, a better cat (bat) "
	 echo "   and fzf to find and prewiew anything with C-t or cmd **TAB "
	 echo "You need to have ~/.bashrc.d/ sourced in your ~/.bashrc for this config to work."
	 echo
   echo "Usage : ./setup.sh [-h -f]"
   echo "Options"
   echo "  -h  : Display this help "
	 echo "  -i  : Run install_packages.sh script beforehand."
   echo "  -f  : Force symlinking by overwrite present files. Use with caution."
 }



# if more than 0 args and 1st arg isnt an option (doesn't start with "-"), exit
if [[ $# -gt 0 && ! $1 =~ ^(-) ]]
then
  echo "Error: Unexpected argument."
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

echo "Making dir ~/.bashrc.d"
echo "You need to have ~/.bashrc.d/ sourced in your ~/.bashrc for this config to work."
mkdir -p ~/.bashrc.d

echo
echo "Now symlinking .vimrc .tmux.conf .gitconfig, own_bashrc and own_aliases."
echo "You can live edit files in ./conf and reload with : $ so    (source ~/.bashrc)"

#set -x
ln -s $OPTS ${CONF_PATH}/vimrc ~/.vimrc
ln -s $OPTS ${CONF_PATH}/tmux.conf ~/.tmux.conf
ln -s $OPTS ${CONF_PATH}/gitconfig ~/.gitconfig
ln -s $OPTS ${CONF_PATH}/own_bashrc ~/.bashrc.d/own_bashrc
ln -s $OPTS ${CONF_PATH}/own_aliases ~/.bashrc.d/own_aliases


## VIM THEME ##
echo "Installing vim customized palenight theme with lightline."
# vim -c 'PlugInstall' -c 'qa!'
mkdir -p ~/.vim
cp -r --update -v ${CONF_PATH}/dot_vim/* ~/.vim/
#cp ${CONF_PATH}/vim/lightline_color_palenight.vim ~/.vim/plugged/palenight.vim/autoload/lightline/colorscheme/palenight.vim
#cp ${CONF_PATH}/vim/color_palenight.vim ~/.vim/plugged/palenight.vim/autoload/palenight.vim


# From https://github.com/catppuccin/gnome-terminal
echo "Installing catppuccin themes for gnome-terminal."
#curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.3.0/install.py | python3 - 
if command -v python3 2>&1 >/dev/null
	then python3 scripts/install_gnome-terminal_theme.py --local scripts/Catppuccin_palette.json
fi


## Bat theme config part
echo "Installing catppuccin themes for bat."

mkdir -p "$(bat --config-dir)/themes"
cp -r --update -v ${CONF_PATH}/themes/bat_Catppuccin_Mocha.tmTheme $(bat --config-dir)/themes/
bat cache --build


# Sourcing the bashrc
echo -e "\nSourcing ~/.bashrc\n"
source ~/.bashrc

echo "In Gnome Terminal, open Edit -> Preferences, and enable the profile for the theme you want. MOCHA !"
