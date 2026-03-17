# Zellij to Tmux Migration

## Context

The project currently uses Zellij as its terminal multiplexer. After 3 days of usage, the decision is to migrate to Tmux for better ecosystem standardization — more tutorials, plugins, community support, and transferable knowledge. This is a clean break: Zellij will be fully removed.

## Decisions

- **Prefix key:** Ctrl+B (standard Tmux default)
- **Plugin manager:** TPM (Tmux Plugin Manager)
- **Theme:** Catppuccin Mocha via `catppuccin/tmux` plugin
- **Navigation:** Vim-style hjkl for pane movement
- **Auto-launch:** Ghostty launches Tmux directly (same as current Zellij behavior)
- **Default shell:** Fish (same as current Zellij default)
- **Cleanup:** Uninstall Zellij via brew, remove `~/.config/zellij/`

## New: configs/tmux.conf

### Core Settings
- `set -g default-terminal "tmux-256color"` + `set -sa terminal-features ',xterm-ghostty:RGB'` for true color
- `set -g default-shell /opt/homebrew/bin/fish`
- `set -g mouse on`
- `set -g base-index 1` / `setw -g pane-base-index 1`
- `set -g renumber-windows on`
- `setw -g mode-keys vi`
- `set -g status-position top` (matches compact bar at top)

### Keybindings
- `prefix + h/j/k/l` — pane navigation
- `prefix + H/J/K/L` — pane resize (uppercase, with `-r` for repeat)
- `prefix + |` — vertical split, `prefix + -` — horizontal split
- `prefix + z` — toggle pane zoom
- `prefix + c` — new window
- `prefix + 1-9` — switch window
- `prefix + x` — close pane
- `prefix + d` — detach
- `prefix + [` — enter copy mode (vi keys to scroll/search/select)
- `prefix + r` — reload config

### Plugins (via TPM)
- `tmux-plugins/tpm`
- `tmux-plugins/tmux-sensible`
- `catppuccin/tmux` (set `@catppuccin_flavor 'mocha'`, configure status modules)

### TPM Bootstrap
TPM cloned to `~/.tmux/plugins/tpm`. Config ends with `run '~/.tmux/plugins/tpm/tpm'`.

## Modified: configs/ghostty.conf

Line 22: `command = /opt/homebrew/bin/zellij` → `command = /opt/homebrew/bin/tmux`

## Modified: guide.md

1. **Stack diagram** — Simplify to one diagram (Tmux always runs via Ghostty auto-launch, no "without multiplexer" variant needed)
2. **"Using Zellij" section** → "Using Tmux (Split Screen)" — rewrite with:
   - Prefix key concept (Ctrl+B then action key)
   - Common pane/window actions
   - Copy mode for scrolling
   - Detach/attach for session persistence
3. **"Finding Files"** — Remove note about Ctrl+T being captured (Tmux doesn't intercept it)
4. **Troubleshooting table** — Replace Zellij rows with Tmux equivalents, remove the Ctrl+T conflict row

## Modified: hotkeys.md

Replace entire "Zellij (Terminal Multiplexer)" section with:
- **Tmux Basics** — prefix key explanation
- **Pane Management** — split, navigate (hjkl), close, zoom, resize
- **Window Management** — new, switch (1-9), rename, close, next/prev
- **Session Management** — detach, list, attach
- **Copy Mode** — enter, scroll, search, select, copy
- Update fzf note: remove Ctrl+T conflict warning

## Modified: CLAUDE.md

- **Stack:** Zellij → Tmux
- **Config Locations:** Replace Zellij entries with `~/.tmux.conf`
- **Notes:** Remove Zellij-specific notes, add Tmux notes (prefix key, copy mode)

## Removed Files

- `configs/zellij.kdl`
- `configs/zellij-layout-default.kdl`

## System Cleanup

- `brew uninstall zellij`
- `rm -rf ~/.config/zellij/`
- Install tmux: `brew install tmux`
- Clone TPM: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

## Verification

1. Run `brew install tmux` and verify it's at `/opt/homebrew/bin/tmux`
2. Write `~/.tmux.conf` and clone TPM
3. Launch `tmux`, run `prefix + I` to install plugins
4. Verify Catppuccin theme loads (status bar should be mocha-colored)
5. Test keybindings: `prefix + |` (split), `prefix + h/l` (navigate), `prefix + z` (zoom)
6. Test copy mode: `prefix + [`, scroll with j/k, search with `/`
7. Quit tmux, update Ghostty config, relaunch Ghostty — should auto-enter Tmux
8. Verify Ctrl+T works for fzf inside Tmux
9. Verify `brew uninstall zellij` completes and `~/.config/zellij/` is removed
