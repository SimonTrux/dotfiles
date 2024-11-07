#!/bin/bash

echo "vim tmux are needed. Soon to add z and fdf, maybe zsh."
echo "Now symlinking .vimrc and .tmux.conf file"
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
