# Terminal Setup Context

## Setup on a New Mac
```
git clone https://github.com/hello-keith/terminal-guide.git
cd terminal-guide
./setup.sh
```

## Stack
- **Terminal emulator:** Ghostty (Catppuccin Mocha theme, JetBrainsMono Nerd Font Mono, launches fish login shell which starts tmux)
- **Shell:** Fish (default login shell; also used as Ghostty's launch command to bootstrap PATH for tmux)
- **Alt shell:** Nushell with vi edit mode (manually invoked via `nu`)
- **Prompt:** Starship (powerline pill segments, Catppuccin Mocha palette)
- **Multiplexer:** Tmux (Ctrl+A prefix, omerxx/catppuccin-tmux fork theme via TPM, vim-style navigation)

## Startup Flow
Ghostty -> Fish (login shell, sets up PATH) -> tmux new-session -> Fish -> Starship prompt

## CLI Tools
- `eza` -- ls replacement (Fish: aliased as `l`, `ll`, `lt`; Nushell: only `lt` uses eza, `l`/`ll` use native `ls`)
- `bat` -- cat replacement (aliased as `cat`, Catppuccin Mocha theme)
- `delta` -- git diff pager (side-by-side, line numbers, aliased as `diff`)
- `zoxide` -- smart cd (tracks frecency, use `z` to jump)
- `fzf` -- fuzzy finder (Fish: key bindings sourced via `fzf --fish`)
- `atuin` -- shell history (synced, searchable)
- `mise` -- dev tool version manager (shims in PATH)
- `carapace` -- completion engine for Nushell

## Config Locations
All configs live in this repo (`configs/`) and are symlinked to their expected paths:
- Ghostty: `~/.config/ghostty/config` -> `configs/ghostty.conf`
- Starship: `~/.config/starship/starship.toml` -> `configs/starship.toml`
- Tmux: `~/.config/tmux/tmux.conf` -> `configs/tmux.conf`
- Tmux keybindings: `~/.config/tmux/tmux.reset.conf` -> `configs/tmux.reset.conf`
- Nushell config: `~/Library/Application Support/nushell/config.nu` -> `configs/config.nu`
- Nushell env: `~/Library/Application Support/nushell/env.nu` -> `configs/env.nu`
- bat: `~/.config/bat/config` -> `configs/bat.conf`
- Git (delta): `~/.gitconfig` -> `configs/gitconfig`
- Fish: `~/.config/fish/config.fish` -> `configs/config.fish`

## Fish Aliases
- `l` / `ll` / `lt` -- eza list variants (with icons, git info)
- `c` -- clear
- `cat` -- bat
- `diff` -- delta
- `z <partial>` -- zoxide jump (e.g., `z proj` jumps to ~/projects)
- `agents` -- claude --teammate-mode tmux
- `mini [name]` -- SSH into Mac Mini with tmux (defaults to session `main`, e.g. `mini dev`)
- `tgsync` -- push terminal-guide to origin + sync to Mac Mini
- Git: `gst`, `gc "msg"`, `gca "msg"`, `gp`, `gpu`, `glog`, `gdiff`, `gco`, `gb`, `gba`, `gadd`, `ga` (add -p), `gr`, `gre`

## Nushell Aliases (differ from Fish)
- `l` -- `ls --all` (native, NOT eza)
- `ll` -- `ls -l` (native, NOT eza)
- `lt` -- eza tree view (same as Fish)
- `cat` / `diff` / `c` -- same as Fish
- Git aliases -- same as Fish plus `gcoall` (checkout all)

## Autocomplete (Nushell)
- **Engine:** carapace (bridges zsh, fish, bash, inshellisense completions into Nushell)
- **Algorithm:** fuzzy (set in config.nu `completions.algorithm`)
- **Completer:** defined as `$carapace_completer` closure at top of config.nu, referenced in `completions.external.completer`
- **Bridges env:** `CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'` (set in env.nu)
- carapace init is generated in env.nu (`carapace _carapace nushell | save`) and sourced at end of config.nu
- The completer MUST be defined before `$env.config` block -- dynamic override from init.nu does not persist
- Fish has its own built-in fuzzy completion (no carapace needed)

## Tmux Plugins (via TPM)
- tmux-sensible, tmux-yank, tmux-resurrect, tmux-continuum
- tmux-fzf, tmux-fzf-url
- omerxx/catppuccin-tmux, omerxx/tmux-sessionx, omerxx/tmux-floax
- TPM itself at `~/.tmux/plugins/tpm/tpm`

## Tmux Keybindings (tmux.reset.conf)
- `h/j/k/l` -- vim-style pane navigation
- `\` -- vertical split (preserves path)
- `-` -- horizontal split (preserves path)
- `v` -- begin selection in copy mode
- `R` -- reload config

## Notes
- User is new to terminal workflows -- prefer simple explanations
- Nushell uses vi keybindings (Escape to enter normal mode, i to insert)
- Starship config uses Unicode powerline glyphs (Write tool may strip them)
- Ghostty hot-reloads config on save
- Nushell/Starship require new shell session to pick up config changes
- Tmux uses prefix key Ctrl+A -- press prefix, release, then action key
- Tmux copy mode (Ctrl+A [) for scrolling -- j/k to scroll, / to search, q to exit
- Tmux config reloads with Ctrl+A R (or `tmux source-file ~/.config/tmux/tmux.conf`)

## Multi-Machine Sync

This repo is shared between the local Mac and a Mac Mini (`mini` via Tailscale SSH).

- **Mini repo path:** `/Users/js/projects/terminal-guide`
- **Push + sync alias:** `tgsync` pushes to origin then SSHs to mini to pull (see `sync.md` for full details)
- **Manual sync:** SSH to mini, `cd /Users/js/projects/terminal-guide && git pull --ff-only && ./setup.sh`
- **Mini SSH alias:** `mini [name]` (connects to named tmux session, defaults to `main`)
