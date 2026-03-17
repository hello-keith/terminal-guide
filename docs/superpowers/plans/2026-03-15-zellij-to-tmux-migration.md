# Zellij to Tmux Migration — Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace Zellij with Tmux as the terminal multiplexer, updating all configs and documentation.

**Architecture:** Install Tmux + TPM, write tmux.conf with vim-style nav and Catppuccin Mocha, update Ghostty to auto-launch Tmux, rewrite docs, remove Zellij entirely.

**Tech Stack:** Tmux, TPM, catppuccin/tmux, tmux-sensible, Ghostty, Fish shell.

**Spec:** `docs/superpowers/specs/2026-03-15-zellij-to-tmux-migration-design.md`

---

## Chunk 1: Install, Configure, Integrate

### Task 1: Install Tmux and TPM

- [ ] Run `brew install tmux` — verify binary at `/opt/homebrew/bin/tmux`
- [ ] Run `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

### Task 2: Write tmux.conf

**Files:** Create `configs/tmux.conf`

- [ ] **Write configs/tmux.conf** with this content:

```conf
# ── Terminal & Colors ──
set -g default-terminal "tmux-256color"
set -sa terminal-features ',xterm-ghostty:RGB'

# ── Shell ──
set -g default-shell /opt/homebrew/bin/fish

# ── General ──
set -g mouse on
set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows on
set -g status-position top
set -g detach-on-destroy off

# ── Vi Mode ──
setw -g mode-keys vi

# ── Splits (intuitive keys) ──
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# ── Pane Navigation (vim-style) ──
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# ── Pane Resize (vim-style, repeatable) ──
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# ── Copy Mode (vi-style) ──
bind -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"

# ── Reload Config ──
bind r source-file ~/.tmux.conf \; display "Config reloaded"

# ── Plugins ──
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'catppuccin/tmux'

# ── Catppuccin Theme ──
set -g @catppuccin_flavor 'mocha'
set -g @catppuccin_window_status_style 'rounded'

# ── TPM Bootstrap (keep at bottom) ──
run '~/.tmux/plugins/tpm/tpm'
```

- [ ] Symlink: `ln -sf "$(pwd)/configs/tmux.conf" ~/.tmux.conf`
- [ ] Launch tmux: `/opt/homebrew/bin/tmux new-session -d -s test`
- [ ] Install plugins: inside tmux press `Ctrl+B I` (capital I). Verify Catppuccin theme loads.
- [ ] Test keybindings: `Ctrl+B |` (split), `Ctrl+B h/l` (navigate), `Ctrl+B z` (zoom), `Ctrl+B [` (copy mode), `Ctrl+B r` (reload)
- [ ] Kill test session: `tmux kill-session -t test`
- [ ] Commit: `git add configs/tmux.conf && git commit -m "Add tmux.conf with TPM, Catppuccin Mocha, vim-style navigation"`

### Task 3: Update Ghostty config

**Files:** Modify `configs/ghostty.conf`

- [ ] Replace `command = /opt/homebrew/bin/zellij` with `command = /opt/homebrew/bin/tmux`
- [ ] Open new Ghostty window (`Cmd+N`) — verify it drops into Tmux with Catppuccin status bar
- [ ] Verify `Ctrl+T` triggers fzf (not intercepted)
- [ ] Commit: `git add configs/ghostty.conf && git commit -m "Switch Ghostty command from Zellij to Tmux"`

---

## Chunk 2: Documentation Updates

### Task 4: Rewrite guide.md

**Files:** Modify `guide.md`

- [ ] **Replace stack diagrams (lines 3-20)** — Keep the `# Terminal User Guide` heading (line 1) and blank line (line 2). Replace lines 3-20 with a single diagram. Preserve the `## What's Running and Why` heading and intro text, but use only one diagram (Tmux always runs):

  ```
  ## What's Running and Why

  When you open Ghostty, here's what loads:

  Ghostty (the window)
    └── Tmux (multiplexer — splits, tabs, sessions)
          └── Fish (the shell — where you type commands)
                └── Starship (the colorful prompt line you see)
  ```

  Remove the second "When you run zellij" diagram entirely.

- [ ] **Replace "Using Zellij" section (lines 113-139)** with "Using Tmux (Split Screen)":
  - Explain prefix key concept (`Ctrl+B` then action)
  - Pane actions: `Ctrl+B |` split, `Ctrl+B -` split, `Ctrl+B h/j/k/l` navigate, `Ctrl+B z` zoom, `Ctrl+B x` close
  - Window actions: `Ctrl+B c` new, `Ctrl+B 1-9` jump, `Ctrl+B n/p` next/prev
  - Copy mode: `Ctrl+B [` enter, j/k scroll, / search, q exit
  - Detach: `Ctrl+B d`, reattach: `tmux attach`

- [ ] **Update "Finding Files" (line 150)** — Change `# fzf fuzzy finder (outside Zellij)` to `# fzf fuzzy finder`

- [ ] **Update troubleshooting table (lines 189-200)**:
  - "Zellij bar missing" → "Tmux status bar missing | Open new Ghostty window: Cmd+N"
  - "Can't scroll up" → "Ctrl+B [ enters scroll mode, then j/k. Press q to exit"
  - Remove "Ctrl+T does Zellij tab not fzf" row entirely

- [ ] Commit: `git add guide.md && git commit -m "Rewrite guide.md: replace Zellij with Tmux"`

### Task 5: Rewrite hotkeys.md

**Files:** Modify `hotkeys.md`

- [ ] **Replace Zellij section (lines 48-107)** with Tmux section covering:
  - Prefix key explanation
  - Pane Management table: split (`|`, `-`), navigate (h/j/k/l), zoom (z), close (x), resize (H/J/K/L)
  - Window Management table: new (c), jump (1-9), next/prev (n/p), rename (,), close (&)
  - Session Management table: detach (d), list sessions (s), rename ($)
  - Copy Mode table: enter ([), scroll (j/k), half-page (Ctrl+D/U), search forward (/), search backward (?), select (v), copy (y), exit (q)
  - Reload config: r

- [ ] **Update fzf note** (find the `> **Note:**` block in the fzf section — line numbers will have shifted after replacing the Zellij section above) — Replace Zellij caveat with: "Ctrl+T works everywhere — Tmux does not intercept it."

- [ ] Commit: `git add hotkeys.md && git commit -m "Rewrite hotkeys.md: replace Zellij keybindings with Tmux"`

### Task 6: Update CLAUDE.md

**Files:** Modify `CLAUDE.md`

- [ ] Stack: Replace `Zellij (compact layout, Nerd Font UI, catppuccin-mocha theme)` with `Tmux (Catppuccin Mocha theme via TPM, vim-style navigation)`
- [ ] Config Locations: Replace Zellij entries with `Tmux: ~/.tmux.conf`
- [ ] Notes: Add Tmux notes: prefix key (Ctrl+B), copy mode (Ctrl+B [), config reload (Ctrl+B r). Update "Nushell/Starship require new shell session" note to also mention Tmux config reload via `Ctrl+B r`
- [ ] Commit: `git add CLAUDE.md && git commit -m "Update CLAUDE.md: replace Zellij with Tmux"`

---

## Chunk 3: Cleanup & Verification

### Task 7: Remove Zellij config files

**Files:** Remove `configs/zellij.kdl`, Remove `configs/zellij-layout-default.kdl`

- [ ] `git rm configs/zellij.kdl configs/zellij-layout-default.kdl`
- [ ] Commit: `git commit -m "Remove Zellij config files"`

### Task 8: Uninstall Zellij

- [ ] Kill any running Zellij processes: `killall zellij 2>/dev/null || true`
- [ ] `brew uninstall zellij` (ignore "not installed" if already gone)
- [ ] `rm -rf ~/.config/zellij/`
- [ ] Verify Zellij binary gone: `which zellij` returns not found
- [ ] Verify config dir gone: `[ ! -d ~/.config/zellij ] && echo "Clean"`

### Task 9: Final verification

- [ ] Grep for remaining Zellij refs: `grep -ri "zellij" . --include="*.md" --include="*.conf" --include="*.kdl" --include="*.toml" --include="*.nu"` — only spec/plan docs should match
- [ ] Verify tmux binary: `which tmux` returns `/opt/homebrew/bin/tmux`
- [ ] Close all Ghostty, relaunch — should auto-enter Tmux with Catppuccin theme
- [ ] Test full workflow: split (`Ctrl+B |`), navigate (h/l), new window (c), copy mode ([), fzf (Ctrl+T), zoom (z), detach (d), `tmux attach`
- [ ] Verify Fish + Starship prompt in new panes
