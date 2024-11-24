#!/bin/bash

useful_aliases() {

info " Some useful aliases :
            # Reload bashrc and aliases
         so         ==  source ~/.bashrc
            # Editing config files
         vimrc      ==  vim ~/.vimrc
         tmux.conf  ==  vim ~/.tmux.conf'
         aliases    ==  vim ~/.bashrc.d/own_aliases'
         bashrc     ==  vim ~/.bashrc.d/own_bashrc'
         gitconfig  ==  vim ~/.gitconfig'
            # Extra stuff
         cat        ==  bat
         cd         ==  z        # like cd, but lazy
         k          ==  kubectl  # with autocompletion
         <ctrl> + t or **<tab> after cd or ls for fzf
"
}
