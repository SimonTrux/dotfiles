#!/bin/bash
# Trying to have a generous installer.

if [[ $# -ne 0 ]]
then
  echo "Error: Unexpected argument."
  echo "Usage : $0"
  exit 1
fi

# Packages to be installed.
PKG_LIST="git vim tmux fzf bat zoxide"
EXTRA_PKG_LIST=" npm cargo"

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
    echo -n "unsupported OS"
    ;;
esac

echo " - Running $OS os | $ID."
echo " - Installation planned with : $SUDO $PKG_MGR $INSTALL_CMD"
echo " - Package to be installed : $PKG_LIST"

echo "Do you want to also install vim LSP dependencies : $EXTRA_PKG_LIST ?"
select choice in "yes" "no"; do
	case $choice in
		yes) PKG_LIST+=$EXTRA_PKG_LIST ; break ;;
		no) break ;;
	esac
done

set -x
$SUDO_CMD $PKG_MGR $INSTALL_CMD $PKG_LIST
