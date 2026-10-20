# Vim cheat sheet

Mappings from `conf/vimrc` first, then the built-in shortcuts worth knowing.
`<space>` is a plain key here (no leader is set).

## My mappings (conf/vimrc)

| Keys | Mode | Action |
|---|---|---|
| `kj` | insert | Escape |
| `jk` | insert, cmdline, terminal | Enter (careful: **Esc in neovim**) |
| `<space>c` | normal | `:` (start a command) |
| `<space>h` | normal | Clear search highlight |
| `<space>e` | normal | FZF file finder (`T` in it: open in tab) |
| `Ctrl-e` | normal | Toggle file explorer (netrw, left side) |
| `Ctrl-t` | normal / terminal | Open terminal / exit it |
| `<space><space>` | normal | Next window |
| `<space>` + arrow | normal | Move to window in that direction |
| `Tab` / `Shift-Tab` | insert | Next / previous completion item |
| `Enter` | insert | Accept completion, or open a `{}` block |
| `( [ { `` ` `` | insert | Auto-closed pairs |
| `_sh` | insert | Expands to `#!/bin/bash` |

Yanks (`y`) also go to the system clipboard (`wl-copy` / `xclip` fallback).
Undo history persists across sessions (`~/.vim/undo`).

## Moving

| Keys | Action |
|---|---|
| `h j k l` | Left, down, up, right |
| `w` / `b` / `e` | Next word / previous word / end of word (`W B E`: WORDs, space-separated) |
| `0` / `^` / `$` | Line start / first non-blank / line end |
| `gg` / `G` / `42G` | First line / last line / line 42 |
| `f x` / `t x` | To / before next `x` on the line (`F T` backwards, `;` `,` repeat) |
| `%` | Matching bracket |
| `{` / `}` | Previous / next paragraph |
| `Ctrl-d` / `Ctrl-u` | Half page down / up |
| `zz` / `zt` / `zb` | Center / top / bottom the cursor line |
| `Ctrl-o` / `Ctrl-i` | Jump back / forward in jump list |
| `` `. `` / `ma` then `` `a `` | Last change / set mark `a` and jump to it |

## Editing

| Keys | Action |
|---|---|
| `i` / `a` / `I` / `A` | Insert before / after cursor, at line start / end |
| `o` / `O` | New line below / above |
| `x` / `r x` / `~` | Delete char / replace with `x` / toggle case |
| `dd` / `yy` / `p` / `P` | Delete line / yank line / paste after / before |
| `cw` / `cc` / `C` | Change word / line / to end of line |
| `D` / `J` | Delete to end of line / join lines |
| `u` / `Ctrl-r` / `.` | Undo / redo / repeat last change |
| `>>` / `<<` / `=` | Indent / unindent / auto-indent (`gg=G`: whole file) |
| `Ctrl-a` / `Ctrl-x` | Increment / decrement number |
| `"ayy` / `"ap` | Yank into / paste from register `a` |
| `qa` ... `q` / `@a` / `@@` | Record macro `a` / play it / replay last |

## Operators + text objects

Operator (`d` delete, `c` change, `y` yank, `v` select, `>` indent) + object:

| Object | Meaning | Example |
|---|---|---|
| `iw` / `aw` | Inner / a word | `ciw` change word |
| `i"` / `a"` | Inside / around quotes | `di"` empty a string |
| `i(` / `a(` (`ib`) | Inside / around parentheses | `ci(` change arguments |
| `i{` / `a{` (`iB`) | Inside / around braces | `yi{` yank a block |
| `it` / `at` | Inside / around HTML tag | `dit` |
| `ip` / `ap` | Inner / a paragraph | `dap` |

## Visual mode

| Keys | Action |
|---|---|
| `v` / `V` / `Ctrl-v` | Select chars / lines / block |
| `o` | Jump to the other end of the selection |
| `gv` | Reselect last selection |
| `Ctrl-v`, select, `I` text `Esc` | Insert text on every selected line |

## Search and replace

| Keys | Action |
|---|---|
| `/text` / `?text` | Search forward / backward (lowercase: ignores case) |
| `n` / `N` | Next / previous match |
| `*` / `#` | Search word under cursor forward / backward |
| `:%s/old/new/g` | Replace in whole file (`gc`: confirm each) |
| `:'<,'>s/old/new/g` | Replace in selection |
| `:g/pattern/d` | Delete every line matching |

## Files, buffers, windows, tabs

| Keys | Action |
|---|---|
| `:w` / `:q` / `:wq` / `:q!` | Save / quit / both / quit without saving |
| `:e file` / `:e!` | Open file / reload, dropping changes |
| `:ls` / `:b N` / `:bn` / `:bp` | List buffers / go to buffer N / next / previous |
| `:sp` / `:vs` | Split horizontally / vertically (opens below / right) |
| `Ctrl-w w` / `Ctrl-w q` / `Ctrl-w =` | Next window / close it / equal sizes |
| `:tabnew` / `gt` / `gT` | New tab / next tab / previous tab |
| `:terminal` | Terminal in a split (`Ctrl-w N`: scroll mode) |

## Handy commands

| Command | Action |
|---|---|
| `:set paste` / `:set nopaste` | Paste without auto-indent |
| `:set list!` | Toggle invisible chars |
| `:noh` | Clear search highlight |
| `:!cmd` / `:r !cmd` | Run shell command / insert its output |
| `:PlugInstall` / `:PlugUpdate` | Install / update plugins |
| `:help topic` | Help (`Ctrl-]` follow link, `Ctrl-o` back) |
