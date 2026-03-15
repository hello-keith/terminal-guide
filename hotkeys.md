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
| `Ctrl+A` / `Ctrl+E` | Jump to start / end of line |
| `Alt+Left` / `Alt+Right` | Move word backward / forward |

---

## Tmux (Terminal Multiplexer)

Tmux uses a **prefix key**: press `Ctrl+B`, release, then press the action key.

### Pane Management
| Key | Action |
|-----|--------|
| `Ctrl+B  |` | Split pane vertically (side-by-side) |
| `Ctrl+B  -` | Split pane horizontally (top/bottom) |
| `Ctrl+B  h` | Focus pane left |
| `Ctrl+B  j` | Focus pane below |
| `Ctrl+B  k` | Focus pane above |
| `Ctrl+B  l` | Focus pane right |
| `Ctrl+B  z` | Toggle pane zoom (fullscreen) |
| `Ctrl+B  x` | Close current pane |
| `Ctrl+B  H/J/K/L` | Resize pane (repeatable) |

### Window Management (Tabs)
| Key | Action |
|-----|--------|
| `Ctrl+B  c` | New window |
| `Ctrl+B  1-9` | Jump to window by number |
| `Ctrl+B  n` | Next window |
| `Ctrl+B  p` | Previous window |
| `Ctrl+B  ,` | Rename window |
| `Ctrl+B  &` | Close window |

### Session Management
| Key | Action |
|-----|--------|
| `Ctrl+B  d` | Detach from session |
| `Ctrl+B  s` | List sessions |
| `Ctrl+B  $` | Rename session |

### Copy Mode (Scrolling & Search)
| Key | Action |
|-----|--------|
| `Ctrl+B  [` | Enter copy mode |
| `j / k` | Scroll down / up |
| `Ctrl+D / Ctrl+U` | Half-page down / up |
| `/` | Search forward |
| `?` | Search backward |
| `n / N` | Next / previous match |
| `v` | Start selection |
| `y` | Copy selection |
| `q` | Exit copy mode |

### Reload Config
| Key | Action |
|-----|--------|
| `Ctrl+B  r` | Reload tmux.conf |

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

> **Note:** `Ctrl+T` works everywhere — Tmux does not intercept it.

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

---

## eza (ls replacement)

| Alias | What it shows |
|-------|--------------|
| `l` | Long list with git status |
| `ll` | Long list + hidden files |
| `lt` | Tree view (2 levels deep) with icons |
