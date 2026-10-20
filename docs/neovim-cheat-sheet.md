# Neovim cheat sheet

Mappings from `conf/config_nvim` (leader = `<space>`). Vim motions, text objects
and `:` commands work the same: see `vim-cheat-sheet.md`.
Forgot a key? Press `<space>` and wait: which-key lists what follows.

## Basics (core/keymaps.lua)

| Keys | Action |
|---|---|
| `jk` | Escape (insert mode; careful: **Enter in vim**) |
| `nh` | Clear search highlight |
| `<leader>+` / `<leader>-` | Increment / decrement number |
| `bl` / `bn` | List buffers / next buffer |
| `<leader>sv` / `<leader>sh` | Split vertically / horizontally |
| `<leader>se` / `<leader>sx` | Equal split sizes / close split |
| `<leader>sm` | Maximize / restore current split |
| `<leader>to` / `<leader>tx` | New tab / close tab |
| `<leader>tn` / `<leader>tp` | Next / previous tab |
| `<leader>tf` | Open current buffer in a new tab |
| `<leader>wr` / `<leader>ws` | Restore / save session for this directory |
| `<leader>tt` | `go test -v` |
| `<leader>tc` | `go test -cover` |
| `<leader>tb` | `go test -bench=.` |
| `:Lazy` | Plugin manager UI (`U` update, `S` sync, `X` clean) |
| `:Lazy restore` | Go back to the versions in `lazy-lock.json` |
| `:checkhealth` | Diagnose config, providers, LSP |

## Find (Telescope)

| Keys | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fr` | Recent files |
| `<leader>fs` | Search text in project (live grep) |
| `<leader>fc` | Search word under cursor |
| `<leader>ft` | Find TODO comments |
| `<leader>fn` | Find files in the nvim config |
| In picker: `Ctrl-j` / `Ctrl-k` | Next / previous result |
| In picker: `Ctrl-q` / `Ctrl-t` | Send to quickfix list / open in Trouble |

## File explorer (nvim-tree)

| Keys | Action |
|---|---|
| `<leader>ee` / `<leader>ef` | Toggle explorer / toggle on current file |
| `<leader>ec` / `<leader>er` | Collapse all / refresh |
| In tree: `Enter` / `a` / `d` / `r` | Open / add (end with `/` for a dir) / delete / rename |
| In tree: `x` / `c` / `p` | Cut / copy / paste |
| In tree: `H` / `g?` | Toggle dotfiles / help |

## LSP and diagnostics

| Keys | Action |
|---|---|
| `gd` / `gD` | Definition / declaration |
| `gR` / `gi` / `gt` | References / implementations / type definition |
| `K` | Documentation for symbol under cursor |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol everywhere |
| `<leader>d` / `<leader>D` | Line diagnostics / all diagnostics in buffer |
| `[d` / `]d` | Previous / next diagnostic (with popup) |
| `<leader>rs` | Restart LSP |
| `:Mason` | Install / update language servers, linters, formatters |
| `<leader>xw` / `<leader>xd` | Workspace / document diagnostics |
| `<leader>xq` / `<leader>xl` | Quickfix / location list |
| `<leader>xt` | TODOs |
| `]t` / `[t` | Next / previous TODO comment |

## Completion (nvim-cmp, insert mode)

| Keys | Action |
|---|---|
| `Ctrl-Space` | Show suggestions |
| `Ctrl-j` / `Ctrl-k` | Next / previous suggestion |
| `Enter` | Confirm selected suggestion |
| `Ctrl-e` | Close the menu |
| `Ctrl-f` / `Ctrl-b` | Scroll documentation |

## Git

| Keys | Action |
|---|---|
| `<leader>lg` | LazyGit |
| `]h` / `[h` | Next / previous changed hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hs` / `<leader>hr` | Stage / reset hunk (also on a selection) |
| `<leader>hS` / `<leader>hR` | Stage / reset whole buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hb` / `<leader>hB` | Blame line / toggle inline blame |
| `<leader>hd` / `<leader>hD` | Diff against index / last commit |
| `ih` | Text object: hunk (`vih`, `dih`) |

## Code editing

| Keys | Action |
|---|---|
| `<leader>mp` | Format file or selection (conform) |
| `<leader>l` | Lint current file |
| `gcc` / `gc` + motion | Toggle comment on line / motion (`gc` on selection) |
| `ys` + motion + char | Surround (`ysiw"`: quote a word) |
| `ds` + char / `cs` + old + new | Delete surround / change it (`cs"'`) |
| `s` + motion / `ss` / `S` | Replace with register (motion / line / to end) |
| `Ctrl-Space` (normal) | Select syntax node, again to grow it |

## Treesitter text objects

Use with `v`, `d`, `c`, `y`: `a` = around, `i` = inside.

| Object | Selects |
|---|---|
| `am` / `im` | Function / method definition |
| `af` / `if` | Function call |
| `ac` / `ic` | Class |
| `aa` / `ia` | Parameter / argument |
| `ai` / `ii` | Conditional |
| `al` / `il` | Loop |
| `a=` / `i=` / `l=` / `r=` | Assignment / its value / left side / right side |
| `]m` / `]f` / `]c` / `]i` | Next function / call / class / conditional (`[`: previous) |
| `;` / `,` | Repeat last move forward / backward |
| `<leader>na` / `<leader>pa` | Swap argument with next / previous (`m`: function) |
