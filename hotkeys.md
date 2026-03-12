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

## Nushell (Shell) — Vi Mode

Your shell uses **vi keybindings**. There are two modes:

### Insert Mode (you start here — type normally)
| Key | Action |
|-----|--------|
| `Escape` | Switch to Normal mode |
| `Tab` | Open completions |
| `Ctrl+N` | IDE-style completions (with descriptions) |
| `Ctrl+R` | Search command history |
| `Ctrl+C` | Cancel current input |
| `Ctrl+D` | Exit shell |
| `Ctrl+L` | Clear screen |
| `Up` / `Down` | Browse history |
| `Right` | Accept inline suggestion |
| `Ctrl+Right` | Accept next word of suggestion |
| `Alt+Backspace` | Delete word backward |
| `Ctrl+W` | Delete word backward |
| `Backspace` | Delete character |

### Normal Mode (press Escape first)
Standard vi motions work: `h` `j` `k` `l`, `w` `b` `e`, `0` `$`, `dd`, `yy`, `p`, etc.

Press `i` or `a` to go back to Insert mode.

---

## Zellij (Terminal Multiplexer)

Zellij uses **modes**. You're normally in Normal mode. Press a mode key to enter that mode, then press the action key.

### Quick Reference (works from anywhere except Locked)
| Key | Action |
|-----|--------|
| `Alt + N` | New pane (split) |
| `Alt + H` / `Alt + Left` | Focus pane/tab left |
| `Alt + L` / `Alt + Right` | Focus pane/tab right |
| `Alt + J` / `Alt + Down` | Focus pane below |
| `Alt + K` / `Alt + Up` | Focus pane above |
| `Alt + =` | Make pane bigger |
| `Alt + -` | Make pane smaller |

### Mode Keys (press to enter mode, then press action)

| Mode Key | Mode | What it does |
|----------|------|-------------|
| `Ctrl+A` | **Pane** | Manage panes (split, close, move, resize) |
| `Ctrl+T` | **Tab** | Manage tabs (new, close, rename, switch) |
| `Ctrl+S` | **Scroll** | Scroll through output, search text |
| `Ctrl+N` | **Resize** | Resize panes with h/j/k/l |
| `Ctrl+X` | **Session** | Detach, session manager |
| `Ctrl+B` | **Tmux** | Tmux-compatible shortcuts |
| `Ctrl+G` | **Lock** | Lock keyboard (press Ctrl+G again to unlock) |

Press `Escape` or `Enter` to exit any mode back to Normal.

### Pane Mode (`Ctrl+A` then...)
| Key | Action |
|-----|--------|
| `n` | New pane |
| `d` | Split down |
| `x` | Close pane |
| `z` | Toggle fullscreen |
| `w` | Toggle floating panes |
| `r` | Rename pane |
| `h/j/k/l` | Move focus |

### Tab Mode (`Ctrl+T` then...)
| Key | Action |
|-----|--------|
| `n` | New tab |
| `x` | Close tab |
| `r` | Rename tab |
| `h/k` or `l/j` | Previous / next tab |
| `1-9` | Jump to tab number |
| `a` | Toggle between last two tabs |

### Scroll Mode (`Ctrl+S` then...)
| Key | Action |
|-----|--------|
| `j/k` | Scroll down/up |
| `d/u` | Half-page down/up |
| `Ctrl+F/Ctrl+B` | Full page down/up |
| `G` | Jump to bottom |
| `s` | Start searching |
| `e` | Open scrollback in editor |

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

> **Note:** In Zellij, `Ctrl+T` enters Tab mode instead of fzf file search. Use `Ctrl+T` for fzf only outside Zellij.

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
