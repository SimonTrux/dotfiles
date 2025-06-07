#!/bin/bash

# Ascii art from https://patorjk.com/software/taag/#p=display&f=Big&t=Trux%20dotfiles
# font : Big

ascii() {

  echo -e "
            Welcome to ${txtgrn}
   _____                     _       _    __ _ _
  |_   _|                    | |     | |  / _(_) |
    | |_ __ _   ___  __    __| | ___ | |_| |_ _| | ___  ___
    | | '__| | | \ \/ /   / _' |/ _ \| __|  _| | |/ _ \/ __|
    | | |  | |_| |>  <   | (_| | (_) | |_| | | | |  __/\__ \\
    \_/_|   \__._/_/\_\   \__._|\___/ \__|_| |_|_|\___||___/
${txtrst}"
}

presentation(){
  echo -e "${txtylw} This script will :
  - Install required packages : $PKG_LIST
  - Make your ~/.bashrc source content of ~/.bashrc.d/ where there will be a
  - own_bashrc.sh with custom PS1 prompt and fzf preview using bat + zoxide + kubectl completion if installed
  - Symlink ~/.vimrc ~/.tmux.conf and more so you maintain them in the dotfiles dir instead.
  - My custom theme for vim based on palenight, and with lightline
  - Installing catppuccin themes for bat and for gnome terminal.
  - Add some aliases

(Always review code before running it !)
${txtrst}"
}

Help() {
   echo "This script symlinks files in ./conf. You get : "
	 echo " - Improved vim, tmux, git alias, a cleaner bash, a better cat (bat) "
	 echo "   and fzf to find and prewiew anything with C-t or cmd **TAB "
	 echo "You need to have ~/.bashrc.d/ sourced in your ~/.bashrc for this config to work."
	 echo
   echo "Usage : ./setup.sh [-h -i -f]"
   echo "Options"
   echo "  -h  : Display this help "
# echo "  -i  : Run install_packages.sh script beforehand."
   echo "  -f  : Force symlinking by overwrite present files. Use with caution."
 }
