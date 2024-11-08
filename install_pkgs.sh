#!/bin/bash

PKG_LIST="git vim tmux fzf"

echo "Some packages need installing first : $PKG_LIST"
set -x
sudo dnf install $PKG_LIST
