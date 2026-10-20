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

Crafted on Fedora 41, tested on :

- fedora 41 (workstation / podman container)
- alpine 3.20 (podman container)
- ubuntu 24.04.1 (podman container and wsl)
- debian 12 (podman container)
- KO Rhel / Rocky / Alma => No dnf source for fzf bat and zoxide.

## Install

### Requirements

- Bash
- git (if you want to git clone).

### Clone this repo

```bash
git clone https://github.com/SimonTrux/dotfiles
```

### Run setup

The setup will install required packages and symlink config files.

1 - Install packages (vim, tmux, fzf, bat, zoxide)
2 - symlink files in the `conf` directory to respective places in user home dir.

```bash
# One line does it all
./setup.sh
```

### Which files ?

Config files symlinked are :

- .vimrc
- .tmux.conf
- .gitconfig
- .bashrc.d/own_aliases
- .bashrc.d/own_bashrc

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

### nvim config 

Almost copied from Josean, with Mason v2: `lspconfig.lua` sets server options with `vim.lsp.config`, and mason-lspconfig enables every installed server (see `mason.lua`). To fall back to Mason 1.x, uncomment the pin in `lua/josean/plugins/lsp/workaround-mason.lua`, but v1 needs the old `setup_handlers` code back.

The config needs neovim >= 0.11. When the distro package is older (debian 12, ubuntu 24.04), `setup.sh` downloads the official release (`scripts/install_nvim.sh`, version pinned there) to `/opt` and links it in `/usr/local/bin`. There is no official build for alpine (musl): on alpine < 3.22 the nvim config is skipped.

### Cheat sheets

Most useful shortcuts, with the mappings from these dotfiles, in `docs/`: [vim](docs/vim-cheat-sheet.md), [neovim](docs/neovim-cheat-sheet.md), [tmux](docs/tmux-cheat-sheet.md).

### File location for offline copy

- lsp files are in ~/.local/share/vim-lsp-settings/
- vim plugins files are in ~/.vim/plugged
