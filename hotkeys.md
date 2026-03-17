# Terminal Hotkeys Cheat Sheet

## Ghostty (Terminal App)

| Key | Action |
|-----|--------|
| `Cmd + T` | New tab |
| `Cmd + N` | New window |
| `Cmd + W` | Close tab |
| `Cmd + Q` | Quit Ghostty |
| `Cmd + ,` | Open settings (config file) |
| `Cmd + Shift + ,` | Reload config |
| `Cmd + +` / `Cmd + -` | Increase / decrease font size |
| `Cmd + 0` | Reset font size |
| `Cmd + Shift + Enter` | Toggle fullscreen |
| `Cmd + 1-9` | Switch to tab 1-9 |

---

## Fish (Shell)

| Key | Action |
|-----|--------|
| `Tab` | Open completions |
| `Ctrl+R` | Search command history (Atuin) |
| `Up` / `Down` | Browse history |
| `Right` | Accept inline autosuggestion |
| `Alt+Right` | Accept next word of suggestion |
| `Alt+Backspace` | Delete word backward |
| `Ctrl+W` | Delete word backward |
| `Ctrl+C` | Cancel current input |
| `Ctrl+D` | Exit shell |
| `Ctrl+L` | Clear screen |
| `Home` / `Ctrl+E` | Jump to start / end of line |
| `Alt+Left` / `Alt+Right` | Move word backward / forward |

### Fish-Only Aliases
| Alias | Command |
|-------|---------|
| `agents` | `claude --teammate-mode tmux` |
| `mini` | SSH into Mac Mini with tmux |

---

## Tmux (Terminal Multiplexer)

Tmux uses a **prefix key**: press `Ctrl+A`, release, then press the action key.

### Pane Management
| Key | Action |
|-----|--------|
| `Ctrl+A  \` | Split pane side-by-side |
| `Ctrl+A  -` | Split pane top/bottom |
| `Ctrl+A  h` | Focus pane left |
| `Ctrl+A  j` | Focus pane below |
| `Ctrl+A  k` | Focus pane above |
| `Ctrl+A  l` | Focus pane right |
| `Ctrl+A  z` | Toggle pane zoom (fullscreen) |
| `Ctrl+A  x` | Close current pane |
| `Ctrl+A  Space` | Cycle through pane layouts (flip vertical/horizontal) |
| `Ctrl+A  {` | Swap pane with previous |
| `Ctrl+A  }` | Swap pane with next |
| `Ctrl+A  !` | Break pane into its own window |
| `Ctrl+A  q` | Show pane numbers (type number to jump) |
| `Ctrl+A  Ctrl+O` | Rotate panes |

### Layout Shortcuts
| Key | Action |
|-----|--------|
| `Ctrl+A  M-1` | Force even-horizontal layout |
| `Ctrl+A  M-2` | Force even-vertical layout |
| `Ctrl+A  M-3` | Main-horizontal layout |
| `Ctrl+A  M-4` | Main-vertical layout |
| `Ctrl+A  M-5` | Tiled layout |

> **Tip:** Mouse is enabled — drag pane borders to resize.

### Window Management (Tabs)
| Key | Action |
|-----|--------|
| `Ctrl+A  c` | New window |
| `Ctrl+A  1-9` | Jump to window by number |
| `Ctrl+A  n` | Next window |
| `Ctrl+A  p` | Previous window |
| `Ctrl+A  w` | Visual window/session picker |
| `Ctrl+A  ,` | Rename window |
| `Ctrl+A  &` | Close window |

### Session Management
| Key | Action |
|-----|--------|
| `Ctrl+A  d` | Detach from session |
| `Ctrl+A  s` | Choose session |
| `Ctrl+A  o` | Session manager (sessionx) |

### Copy Mode (Scrolling & Search)
| Key | Action |
|-----|--------|
| `Ctrl+A  [` | Enter copy mode |
| `j / k` | Scroll down / up |
| `Ctrl+D / Ctrl+U` | Half-page down / up |
| `/` | Search forward |
| `?` | Search backward |
| `n / N` | Next / previous match |
| `v` | Start selection |
| `y` | Copy selection (clipboard) |
| `q` | Exit copy mode |

### Extras
| Key | Action |
|-----|--------|
| `Ctrl+A  R` | Reload tmux config |
| `Ctrl+A  P` | Toggle floating pane (floax) |
| `Ctrl+A  Alt+P` | Floax menu (resize, move, pin) |
| `Ctrl+A  ?` | List all keybindings |

---

## Zoxide (Smart Directory Jumping)

| Command | Action |
|---------|--------|
| `z foo` | Jump to most-used directory matching "foo" |
| `z foo bar` | Jump to directory matching both "foo" and "bar" |
| `zi` | Interactive selection with fzf |
| `z -` | Jump to previous directory |

---

## Atuin (Shell History)

| Key | Action |
|-----|--------|
| `Ctrl+R` | Search history (interactive) |
| `Up` | Previous command |
| Type and `Up` | Filter history by what you typed |

---

## fzf (Fuzzy Finder)

| Key | Action |
|-----|--------|
| `Ctrl+T` | Find files (inserts path) |
| `Alt+C` | cd into directory |
| `Ctrl+R` | Search history (may overlap with Atuin) |

> **Note:** `Ctrl+T` works everywhere. Tmux does not intercept it.

---

## Git Aliases

| Alias | Command |
|-------|---------|
| `gst` | `git status` |
| `ga` | `git add -p` (interactive staging) |
| `gadd` | `git add` |
| `gc "message"` | `git commit -m "message"` |
| `gca "message"` | `git commit -a -m "message"` |
| `gp` | `git push origin HEAD` |
| `gpu` | `git pull origin` |
| `glog` | Pretty git log graph |
| `gdiff` | `git diff` |
| `gco <branch>` | `git checkout <branch>` |
| `gb` | `git branch` |
| `gba` | `git branch -a` |
| `gr` | `git remote` |
| `gre` | `git reset` |
| `tgsync` | Push terminal-guide to origin + sync to Mac Mini |

> **Git config:** Delta pager with side-by-side diffs, line numbers, Catppuccin Mocha theme. Merge conflicts use `diff3` (three-way) style.

---

## eza (ls replacement)

| Alias | What it shows | Shell |
|-------|--------------|-------|
| `l` | Long list with git status (eza) | Fish |
| `l` | `ls --all` (native) | Nushell |
| `ll` | Long list + hidden files (eza) | Fish |
| `ll` | `ls -l` (native) | Nushell |
| `lt` | Tree view (2 levels deep) with icons (eza) | Both |

---

## Nushell (Alt Shell)

Nushell uses **vi edit mode** — press `Escape` for normal mode, `i` to insert.

### Keybindings
| Key | Action |
|-----|--------|
| `Tab` | Open completions menu |
| `Ctrl+N` | IDE completion menu |
| `Ctrl+R` | History search (interactive) |
| `Ctrl+Q` | History search (alternative) |
| `Ctrl+L` | Clear screen |
| `Ctrl+C` | Cancel command |
| `Ctrl+D` | Quit shell |
| `Ctrl+O` | Open command in editor |
| `F1` | Help menu |
| `Escape` | Enter vi normal mode |

### Nushell-Only Aliases
| Alias | Command |
|-------|---------|
| `gcoall` | `git checkout -- .` (revert all files) |
| `cx <dir>` | `cd` + `ls -l` (change dir and list) |
| `asr` | `atuin scripts run` |
| `agents` | `claude --teammate-mode tmux` |
| `mini` | SSH into Mac Mini with tmux |

> **Note:** Most git and utility aliases (`cat`, `diff`, `c`) are the same as Fish.
