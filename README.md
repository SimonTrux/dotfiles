# Dotfiles

A simple repo to pull and grow my cli config around.

## What does it do ?

Install my custom cli setup with :
- Vimrc including themes and Plug manager
- tmux config
- own_bashrc (leave your original almost as is)
- a nicer PS1 prompt, some colors in terminal (256 colors compatible)
- quality of life aliases (at least for me)

### On which platform ?

Crafted on Fedora 40, tested on :

- fedora 40         (workstation / podman container)
- alpine 3.20       (podman container)
- ubuntu 24.04.1    (podman container and wsl)
- debian 12         (podman container)
- KO Rhel / Rocky / Alma => No dnf source for fzf bad and zoxide.

## Intall

### Requirements

- Bash
- git (if you want to git clone).

### Clone this repo

```bash
git clone https://www.github.com/SimonTrux/dotfiles
```

### Run setup

The setup will install required packages and symlink config files.

1 - Install packages (vim, tmux, fzf, bat, zoxide)
2 - symlink files in the `conf` directory to respective places in user home dir.

```
# One line does it all
./setup.sh
```

### Which files ?

Config files symlinked are :

- .vimrc
- .tmux.conf
- .gitconfig
- .bashrd.d/own_aliases
- .bashrd.d/own_bashrc

### Interesting aliases

```
so  # to source ~/.bashrc

vimrc   # to vim ~/.vimrc (which will modifie the dotfiles/conf/vimrc) 
bashrc  # to vim ~/.bashrc 
        # etc... look at script/func/useful_aliases.sh
```

### Vim plugin

If you want to use LSP, do `:PlugInstall` to install LSP plug, that will then need servers.

LSP requires `cargo` and `npm` installed.
To install LSP for a new language, open a file with extention of choosen language (ex file.go) and run `:LspInstallServer`
To remove one, run ":LspUninstallServer <server name>"

### File location for offline copy

- lsp files are in ~/.local/share/vim-lsp-settings/
- vim plugins files are in ~/.vim/plugged
