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

### Window Management (Tabs)
| Key | Action |
|-----|--------|
| `Ctrl+A  c` | New window |
| `Ctrl+A  1-9` | Jump to window by number |
| `Ctrl+A  n` | Next window |
| `Ctrl+A  p` | Previous window |
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

---

## eza (ls replacement)

| Alias | What it shows |
|-------|--------------|
| `l` | Long list with git status |
| `ll` | Long list + hidden files |
| `lt` | Tree view (2 levels deep) with icons |
