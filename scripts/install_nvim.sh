#!/bin/bash
# Make sure neovim is recent enough for conf/config_nvim (>= 0.11).
# Distro packages are often older (debian 12: 0.7, ubuntu 24.04: 0.9):
# download the official release instead.
# Exits 1 when no recent enough neovim could be set up.

source scripts/func/echolor.sh
source scripts/func/nvim_version.sh

NVIM_VERSION="v0.12.6"

# neovim not installed (not chosen in install_pkgs.sh): nothing to do
command -v nvim > /dev/null 2>&1 || exit 0

SUDO_CMD="sudo"
if [[ $EUID == 0 ]]
  then SUDO_CMD=""
fi

# Ubuntu: installing neovim makes "vim" run nvim (same update-alternatives priority)
if [ -x /usr/bin/vim.basic ] && command -v update-alternatives > /dev/null 2>&1 \
  && [ "$(readlink -f "$(command -v vim)")" != "/usr/bin/vim.basic" ]; then
  $SUDO_CMD update-alternatives --set vim /usr/bin/vim.basic > /dev/null
  echolor "vim command points back to vim (neovim had taken it over)."
fi

if nvim_recent_enough ; then
  echolor "$(nvim --version | head -1) is recent enough for the neovim config."
  exit 0
fi

info "$(nvim --version | head -1) is too old, the neovim config needs >= 0.11."

# Official builds only exist for Linux glibc: not for musl (alpine) or other OSes
if [ "$(uname -s)" != "Linux" ] || ldd --version 2>&1 | grep -qi musl ; then
  info "No official neovim build for this system. Install neovim >= 0.11 another way (alpine >= 3.22 packages it)."
  exit 1
fi

case $(uname -m) in
  x86_64)        ARCH="x86_64" ;;
  aarch64|arm64) ARCH="arm64" ;;
  *)
    info "No official neovim build for $(uname -m)."
    exit 1
    ;;
esac

URL="https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-${ARCH}.tar.gz"
TMP_DIR=$(mktemp -d)
info "Downloading neovim ${NVIM_VERSION} from ${URL}"
if ! curl -fsSL "$URL" -o "$TMP_DIR/nvim.tar.gz" ; then
  info "Download failed."
  rm -rf "$TMP_DIR"
  exit 1
fi

# Installed in /opt, linked in /usr/local/bin which comes before /usr/bin in PATH
$SUDO_CMD rm -rf "/opt/nvim-linux-${ARCH}"
$SUDO_CMD tar -xzf "$TMP_DIR/nvim.tar.gz" -C /opt
$SUDO_CMD ln -sf "/opt/nvim-linux-${ARCH}/bin/nvim" /usr/local/bin/nvim
rm -rf "$TMP_DIR"
hash -r

nvim_recent_enough
echolor "Installed $(nvim --version | head -1) in /opt/nvim-linux-${ARCH}, linked to /usr/local/bin/nvim."
