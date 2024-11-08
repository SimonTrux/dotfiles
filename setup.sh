#!/bin/bash

#PWD=eval "$(pwd)"
CONF="conf"

#echo "We are at $PWD"

echo "Making dir ~/.bashrc.d"
mkdir -p ~/.bashrc.d

echo
echo "Now symlinking .vimrc .tmux.conf and .gitconfig file"

set -x
ln -sf ${PWD}/${CONF}/vimrc ~/.vimrc
ln -sf ${PWD}/${CONF}/tmux.conf ~/.tmux.conf
ln -sf ${PWD}/${CONF}/gitconfig ~/.gitconfig
ln -sf ${PWD}/${CONF}/own_bashrc ~/.bashrc.d/own_bashrc
ln -sf ${PWD}/${CONF}/own_aliases ~/.bashrc.d/own_aliases

set +x

echo "Sourcing ~/.bashrc"
source ~/.bashrc

