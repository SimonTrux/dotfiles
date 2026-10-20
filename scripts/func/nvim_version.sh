#!/bin/bash

# True if the installed nvim is at least 0.11, the minimum for conf/config_nvim (vim.lsp.config)
nvim_recent_enough() {
  local version major minor
  version=$(nvim --version 2>/dev/null | head -1 | grep -oE '[0-9]+\.[0-9]+' | head -1)
  [ -n "$version" ] || return 1
  major=${version%%.*}
  minor=${version#*.}
  (( major > 0 || minor >= 11 ))
}
