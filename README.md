# Dotfiles

A simple repo to pull and grow my cli config around.

## What does it do ?

Vimrc including themes, bashrc, some aliases, a nicer PS1 prompt, some colors in terminal (256 colors compatible)

## Intall

### Clone this repo

```bash
git clone https://www.github.com/SimonTrux/dotfiles
```

### Run setup

The setup will install required packages and symlink config files.

1 - Install packages (git, vim, tmux, fzf, bat, zoxide)
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
        # etc... look at aliases.
```

### Vim plugin

If you want to use LSP, do `:PlugInstall` to install LSP plug, that will then need servers.

LSP requires `cargo` and `npm` installed.
To install LSP for a new language, open a file with extention of choosen language (ex file.go) and run `:LspInstallServer`
To remove one, run ":LspUninstallServer <server name>"

### File location for offline copy

- lsp files are in ~/.local/share/vim-lsp-settings/
- vim plugins files are in ~/.vim/plugged
