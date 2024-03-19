# Dotfiles

## Which files ?

For now this is just my .vimrc config file.

## Intall

### Clone this repo

```bash
git clone git@github.com:SimonTrux/dotfiles.git ~/dotfiles
```

### Run setup.sh

It will symlink (force) my ~/.vimrc file to ~/dotfiles/vimrc

```
./setup.sh
```

### Extra commands

The plugin manager should install itself on first launch, then do `:PlugInstall` to install plugs.

To install LSP for a new language, open a file with extention of choosen language (ex file.go) and run `:LspInstallServer`
To remove one, run ":LspUninstallServer <server name>"

### File location for offline copy

- lsp files are in ~/.local/share/vim-lsp-settings/

- vim plugins files are in ~/.vim/plugged
