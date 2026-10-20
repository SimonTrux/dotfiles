#!/bin/bash

# Run from the repo dir so relative paths work wherever setup.sh is called from
cd "$(dirname "$0")" || exit 1

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
scripts/install_nvim.sh
if command -v nvim &> /dev/null && ! nvim_recent_enough ; then
  info "Skipping the neovim config: it needs neovim >= 0.11 and would fail to load.\n"
elif command -v nvim &> /dev/null ; then
  mkdir -p ~/.config
  # A real dir (from the old copy-based install) would block the symlink: back it up
  if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
    mv ~/.config/nvim ~/.config/nvim.bak-$(date +%Y%m%d%H%M%S)
    info "Existing ~/.config/nvim moved to a ~/.config/nvim.bak-* backup."
  fi
  run_color set_symlink ${CONF_PATH}/config_nvim ~/.config/nvim $OPTS
fi

info "Run \"source ~/.bashrc\" or open a new terminal to load the config.\n"
info "You can live edit files in ./conf and reload with command  \"$ so\"    (source ~/.bashrc)\n"
useful_aliases

