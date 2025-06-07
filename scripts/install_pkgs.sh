#!/bin/bash
# Trying to have a generous installer.

source scripts/func/echolor.sh

if [[ $# -ne 0 ]]
then
  echo "Error: Unexpected argument."
  echo "Usage : $0"
  exit 1
fi

# Packages to be installed.
PKG_LIST="grep vim tmux fzf bat zoxide"
VIM_LSP_DEPS=" npm cargo"
NEOVIM_PKG=" neovim make gcc"

# if "tput" is missing, add ncurses which provides it to PKG_LIST
# This will trigger install in next block as "command -v ncuses" will fail.
# On subsequent run, wont add ncurses so wont rerun if all pkgs are installed.
if ! command -v tput > /dev/null 2>&1 ; then
  PKG_LIST+=" ncurses"
fi

echo "Do you want to install neovim with config ?"
select choice in "yes" "no"; do
	case $choice in
		yes) PKG_LIST+=$NEOVIM_PKG ; break ;;
		no) break ;;
	esac
done

echo "Do you want to also install vim LSP dependencies : $VIM_LSP_DEPS ?"
select choice in "yes" "no"; do
	case $choice in
		yes) PKG_LIST+=$VIM_LSP_DEPS ; break ;;
		no) break ;;
	esac
done

# Check If all packages are already installed.
SKIP_INSTALL=true
info "PKG_LIST = $PKG_LIST"
for pkg in $PKG_LIST ; do
  if ! command -v $pkg &> /dev/null && [ "$pkg" != "neovim" ] ; then
    echo $pkg
    info Some packages need installing.
    SKIP_INSTALL=false
    break
  # edge case : neovim pkg / nvim binary
  elif ! command -v nvim &> /dev/null && [ "$pkg" == "neovim" ] ; then
    info Some packages need installing.
    SKIP_INSTALL=false
    break
  fi

done

if $SKIP_INSTALL ; then
  echolor "All required packages are already installed.\n"
  exit 0
fi

# Check if already installed

# Default command
INSTALL_CMD="install"
SUDO_CMD="sudo"

# Select proper package installer
OS=$(uname -s | tr A-Z a-z)
case $OS in
  linux)
    source /etc/os-release
    case $ID in
      debian|ubuntu|mint)
        PKG_MGR="apt-get"
        ;;
      fedora|rhel|centos|almalinux|rocky)
        PKG_MGR="yum"
        ;;
      suse|SLE|opensuse|opensuse-leap)
        PKG_MGR="zypper"
        ;;
      alpine)
        PKG_MGR="apk"
        INSTALL_CMD="add"
        ;;
      arch)
        PKG_MGR="pacman"
        INSTALL_CMD="-S"
        ;;
      *)
        echo -e "Unsupported linux distro"
        ;;
    esac
  ;;

  darwin)
    PKG_MGR="brew"
    SUDO_CMD=""
    ;;
  *)
    echo -e "Unsupported OS"
    ;;
esac

# If brew is present, takes precedence.
if command -v brew 2&>/dev/null ; then
  PKG_MGR="brew"
  SUDO_CMD=""
fi

# If you are root, no sudo
if [[ $EUID == 0 ]]
  then SUDO_CMD=""
fi

info "Running $OS os | $ID."
info "Installation planned with : $SUDO $PKG_MGR $INSTALL_CMD"
info "Package to be installed : $PKG_LIST"


$SUDO_CMD $PKG_MGR $INSTALL_CMD $PKG_LIST
echolor "Packages installed."
