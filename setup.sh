#!/bin/bash

echo "symlink .vimrc and .tmux.conf file"
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
