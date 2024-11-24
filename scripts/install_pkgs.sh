#!/bin/bash
# Trying to have a generous installer.

source scripts/echolor.sh

if [[ $# -ne 0 ]]
then
  echo "Error: Unexpected argument."
  echo "Usage : $0"
  exit 1
fi

# Packages to be installed.
PKG_LIST="ncurses grep vim tmux fzf bat zoxide"
EXTRA_PKG_LIST=" npm cargo"

# if "tput" is missing, add ncurses which provides it to PKG_LIST
# This will trigger install in next block as "command -v ncuses" will fail.
# On subsequent run, wont add ncurses so wont rerun if all pkgs are installed.
if ! command -v tput > /dev/null 2>&1 ; then
  PKG_LIST+="ncurses"
fi

# Check If all packages are already installed.
SKIP_INSTALL=true
for pkg in $PKG_LIST ; do
  if ! command -v $pkg > /dev/null 2>&1 ; then
    info Some packages need installing.
    SKIP_INSTALL=false
    break
  fi
done

if $SKIP_INSTALL ; then
  echolor All required packages are already installed.
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
        PKG_MGR="apt"
        ;;
      fedora|rhel|centos|almalinux|rocky)
        PKG_MGR="yum"
        ;;
      suse)
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
        echo -n "Unsupported linux distro"
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

# If you are root, no sudo
if [[ $EUID == 0 ]]
  then SUDO_CMD=""
fi


info "Running $OS os | $ID."
info "Installation planned with : $SUDO $PKG_MGR $INSTALL_CMD"
info "Package to be installed : $PKG_LIST"

echo "Do you want to also install vim LSP dependencies : $EXTRA_PKG_LIST ?"
select choice in "yes" "no"; do
	case $choice in
		yes) PKG_LIST+=$EXTRA_PKG_LIST ; break ;;
		no) break ;;
	esac
done

set -x
$SUDO_CMD $PKG_MGR $INSTALL_CMD $PKG_LIST
echolor "Packages installed."
set +x
