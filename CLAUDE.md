# Terminal Setup Context

## Stack
- **Terminal emulator:** Ghostty (Catppuccin Mocha theme, JetBrainsMono Nerd Font)
- **Shell:** Nushell (default login shell) with vi edit mode
- **Prompt:** Starship (powerline pill segments, Catppuccin palette)
- **Multiplexer:** Tmux (Catppuccin Mocha theme via TPM, vim-style navigation)
- **Alt shell:** Fish (same Starship prompt, used occasionally)

## CLI Tools
- `eza` — ls replacement (aliased as `l`, `ll`, `lt` with `--icons=always`)
- `bat` — cat replacement (aliased as `cat`, Catppuccin Mocha theme)
- `delta` — git diff pager (side-by-side, line numbers, aliased as `diff`)
- `zoxide` — smart cd (tracks frecency, use `z` to jump)
- `fzf` — fuzzy finder
- `atuin` — shell history (synced, searchable)
- `mise` — dev tool version manager (shims in PATH)
- `carapace` — completion engine for Nushell

## Config Locations
- Ghostty: `~/.config/ghostty/config`
- Starship: `~/.config/starship/starship.toml`
- Nushell config: `~/Library/Application Support/nushell/config.nu`
- Nushell env: `~/Library/Application Support/nushell/env.nu`
- Tmux: `~/.tmux.conf`
- Fish: `~/.config/fish/config.fish`
- bat: `~/.config/bat/config`
- Git (delta): `~/.gitconfig`

## Shell Aliases (Nushell + Fish)
- `l` / `ll` / `lt` — eza list variants
- `c` — clear
- `cat` — bat
- `diff` — delta
- `z <partial>` — zoxide jump (e.g., `z proj` jumps to ~/projects)
- Git: `gst`, `gc "msg"`, `gp`, `gpu`, `glog`, `gdiff`, `gco`, `gb`, `ga`

## Autocomplete
- **Engine:** carapace (bridges zsh, fish, bash, inshellisense completions into Nushell)
- **Algorithm:** fuzzy (set in config.nu `completions.algorithm`)
- **Completer:** defined as `$carapace_completer` closure at top of config.nu, referenced in `completions.external.completer`
- **Bridges env:** `CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'` (set in env.nu)
- carapace init is generated in env.nu (`carapace _carapace nushell | save`) and sourced at end of config.nu
- The completer MUST be defined before `$env.config` block — dynamic override from init.nu does not persist

## Notes
- User is new to terminal workflows — prefer simple explanations
- Nushell uses vi keybindings (Escape to enter normal mode, i to insert)
- Starship config uses Python-written Powerline glyphs (Write tool strips them)
- Ghostty hot-reloads config on save
- Nushell/Starship require new shell session to pick up config changes
- Tmux uses prefix key Ctrl+B — press prefix, release, then action key
- Tmux copy mode (Ctrl+B [) for scrolling — j/k to scroll, / to search, q to exit
- Tmux config reloads with Ctrl+B r (or `tmux source-file ~/.tmux.conf`)
