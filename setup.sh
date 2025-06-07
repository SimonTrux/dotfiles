#!/bin/bash

# import functions like echolor and hello and presentation
for file in scripts/func/* ; do
  . $file 2> /dev/null
done

# if more than 0 args and 1st arg isnt an option (doesn't start with "-"), exit
if [[ $# -gt 0 && ! $1 =~ ^(-) ]]
then
  echolor "Error: Unexpected argument."
  Help
  exit 1
fi

# ASCI ART and Presentation
ascii
presentation

# Variable sections
CONF_PATH="${PWD}/conf"
OPTIONS=":hf"

# Options handling
while getopts ${OPTIONS} option; do
   case $option in
      h)  # display Help
         Help
         exit ;;
#     i)  # run install_pkgs.sh
#        info "INSTALLING PACKAGES"
#        ./scripts/install_pkgs.sh ;;
      f)  # force symlinking
         OPTS="-f";;
      ?) # Invalid option
         echo "Error: Invalid option"
         Help
         exit 1 ;;
   esac
done


info "INSTALLING PACKAGES"
scripts/install_pkgs.sh


info "BASHRC SETUP"
scripts/bashrc_setup.sh


info "SYMLINKING"
run_color set_symlink ${CONF_PATH}/vimrc ~/.vimrc $OPTS
run_color set_symlink ${CONF_PATH}/tmux.conf ~/.tmux.conf $OPTS
run_color set_symlink ${CONF_PATH}/gitconfig ~/.gitconfig $OPTS
run_color set_symlink ${CONF_PATH}/own_bashrc ~/.bashrc.d/own_bashrc $OPTS
run_color set_symlink ${CONF_PATH}/own_aliases ~/.bashrc.d/own_aliases $OPTS


info "THEMES"
scripts/themes_install.sh $CONF_PATH


info "NEOVIM CONFIG"
## NVIM CONF ##
if command -v nvim &> /dev/null ; then
  mkdir -p ~/.config/nvim
  cp -r --update ${CONF_PATH}/config_nvim/* ~/.config/nvim/
  echolor "Installing neovim custom config. Need to install neovim manually though."
fi

# Sourcing the bashrc
source ~/.bashrc
echolor "Sourcing ~/.bashrc\n"

info "You can live edit files in ./conf and reload with command  \"$ so\"    (source ~/.bashrc)\n"
useful_aliases

