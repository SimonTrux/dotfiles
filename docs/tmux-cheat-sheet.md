# tmux cheat sheet

From `conf/tmux.conf`: two prefixes, **`Ctrl-b`** (default) and **`Ctrl-Space`**.
Below, `prefix` means press either one, release, then the key.
Windows and panes are numbered from **1**. Mouse is on: click, drag borders, scroll.

## My settings (conf/tmux.conf)

| Keys | Action |
|---|---|
| `Ctrl-Space` | Second prefix |
| `prefix r` | Reload `~/.tmux.conf` |
| `prefix h` / `j` / `k` / `l` | Move to pane left / down / up / right |
| Copy mode uses vi keys | `Space` select, `Enter` copy (see below) |
| Mouse | Select pane / window, resize, scroll |

## Sessions

| Keys / command | Action |
|---|---|
| `tmux` / `tmux new -s name` | New session / named session |
| `tmux ls` | List sessions |
| `tmux a` / `tmux a -t name` | Attach last / named session |
| `tmux kill-session -t name` | Kill a session |
| `prefix d` | Detach (session keeps running) |
| `prefix s` | Pick a session from a tree |
| `prefix $` | Rename session |
| `prefix (` / `prefix )` | Previous / next session |

## Windows (tabs)

| Keys | Action |
|---|---|
| `prefix c` | New window |
| `prefix 1` ... `9` | Go to window N |
| `prefix n` / `prefix p` | Next / previous window |
| `prefix ;` | Last active pane (`prefix l`, last window by default, is remapped to pane right) |
| `prefix w` | Pick a window from a tree |
| `prefix ,` | Rename window (auto-named after the running command) |
| `prefix &` | Kill window (asks) |
| `prefix .` | Move window to another number |

## Panes (splits)

| Keys | Action |
|---|---|
| `prefix %` | Split left / right |
| `prefix "` | Split top / bottom |
| `prefix h j k l` / arrows | Move between panes |
| `prefix o` | Next pane |
| `prefix z` | Zoom pane (full window) / unzoom |
| `prefix x` | Kill pane (asks) |
| `prefix !` | Move pane to its own window |
| `prefix {` / `prefix }` | Swap pane with previous / next |
| `prefix Space` | Cycle layouts |
| `prefix q` | Show pane numbers (type one to jump) |
| `prefix Ctrl-arrow` | Resize by 1 (hold prefix keys: repeat) |
| `prefix Alt-arrow` | Resize by 5 |

## Copy mode (vi keys)

| Keys | Action |
|---|---|
| `prefix [` | Enter copy mode (or scroll up with the mouse) |
| `h j k l`, `w b`, `Ctrl-u` / `Ctrl-d` | Move around |
| `/` / `?` then `n` / `N` | Search down / up, next / previous match |
| `Space` | Start selection (`v`: toggle rectangle selection) |
| `Enter` | Copy selection and leave copy mode |
| `Esc` / `q` | Clear selection / leave copy mode |
| `prefix ]` | Paste the copied text |
| `prefix =` | Pick from all copied buffers |

## Misc

| Keys / command | Action |
|---|---|
| `prefix ?` | List every key binding |
| `prefix :` | tmux command prompt |
| `prefix t` | Big clock |
| `prefix ~` | Show tmux messages |
| `:setw synchronize-panes` | Type in every pane at once (run again to stop) |
| `:resize-pane -D 10` | Resize by 10 (`-U -L -R`) |
| `tmux source ~/.tmux.conf` | Reload config from a shell |
