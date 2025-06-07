#!/bin/bash

source scripts/func/echolor.sh

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
  echolor "Creating ~/.bashrc.d dir and ensuring it is sourced by ~/.bashrc.\n"
fi
echolor "~/.bashrc and ~/.bashrc.d configured."
