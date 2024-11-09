# Dotfiles

A simple repo to pull and grow my cli config around.

## Which files ?

- .vimrc
- .tmux.conf
- .gitconfig
- .bashrd.d/own_aliases
- .bashrd.d/own_bashrc

## Intall

### Clone this repo

```bash
git clone git@github.com:SimonTrux/dotfiles.git ~/dotfiles
```

### Run install_pkgs.sh and setup.sh

1 - Install packages
2 - symlink files in the `conf` directory to respective places in user home dir.

```
# Install 
./install_pkgs.sh

./setup.sh
```

### Interesting aliases

```
so  # to source ~/.bashrc

vimrc   # to vim ~/.vimrc (which will modifie the dotfiles/conf/vimrc) 
bashrc  # to vim ~/.bashrc 
        # etc... look at aliases.
```

### Vim plugin

The vim plugin manager should install itself on first launch, then do `:PlugInstall` to install plugs.

LSP requires `cargo` and `npm` installed.
To install LSP for a new language, open a file with extention of choosen language (ex file.go) and run `:LspInstallServer`
To remove one, run ":LspUninstallServer <server name>"

### File location for offline copy

- lsp files are in ~/.local/share/vim-lsp-settings/
- vim plugins files are in ~/.vim/plugged
