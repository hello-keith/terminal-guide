#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIGS="$REPO_DIR/configs"

echo "=== Terminal Setup ==="
echo "Repo: $REPO_DIR"
echo ""

# ── 1. Homebrew ──────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Installing formulae..."
brew install \
  atuin bat carapace direnv eza fish fzf git git-delta jq \
  mise mosh nushell starship stow tailscale terminal-notifier tmux zoxide

echo "Installing casks..."
brew install --cask font-jetbrains-mono-nerd-font

# ── 2. Create config directories ─────────────────────────────
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/starship
mkdir -p ~/.config/tmux
mkdir -p ~/.config/fish
mkdir -p ~/.config/bat/themes
mkdir -p ~/.config/atuin
mkdir -p ~/.config/mise
mkdir -p ~/Library/Application\ Support/nushell

# ── 3. Symlink configs ───────────────────────────────────────
link() {
  local src="$1" dst="$2"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "  Backing up $dst -> ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi
  ln -sf "$src" "$dst"
  echo "  $dst -> $src"
}

echo ""
echo "Linking configs..."
link "$CONFIGS/ghostty.conf"               ~/.config/ghostty/config
link "$CONFIGS/starship.toml"              ~/.config/starship/starship.toml
link "$CONFIGS/tmux.conf"                  ~/.config/tmux/tmux.conf
link "$CONFIGS/tmux.reset.conf"            ~/.config/tmux/tmux.reset.conf
link "$CONFIGS/config.nu"                  ~/Library/Application\ Support/nushell/config.nu
link "$CONFIGS/env.nu"                     ~/Library/Application\ Support/nushell/env.nu
link "$CONFIGS/bat.conf"                   ~/.config/bat/config
link "$CONFIGS/gitconfig"                  ~/.gitconfig
link "$CONFIGS/config.fish"                ~/.config/fish/config.fish
link "$CONFIGS/atuin.toml"                 ~/.config/atuin/config.toml
link "$CONFIGS/mise.toml"                  ~/.config/mise/config.toml
link "$CONFIGS/Catppuccin Mocha.tmTheme"   ~/.config/bat/themes/Catppuccin\ Mocha.tmTheme
link "$CONFIGS/Catppuccin Macchiato.tmTheme" ~/.config/bat/themes/Catppuccin\ Macchiato.tmTheme

# ── 4. bat theme cache ────────────────────────────────────────
echo ""
echo "Building bat theme cache..."
bat cache --build

# ── 5. Set default shell to Fish ──────────────────────────────
FISH_PATH="/opt/homebrew/bin/fish"
if ! grep -q "$FISH_PATH" /etc/shells 2>/dev/null; then
  echo "Adding Fish to /etc/shells (needs sudo)..."
  echo "$FISH_PATH" | sudo tee -a /etc/shells
fi
if [ "$SHELL" != "$FISH_PATH" ]; then
  echo "Setting Fish as default shell..."
  chsh -s "$FISH_PATH"
fi

# ── 6. TPM (Tmux Plugin Manager) ─────────────────────────────
if [ ! -d ~/.tmux/plugins/tpm ]; then
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
echo "Installing tmux plugins..."
~/.tmux/plugins/tpm/bin/install_plugins

# ── 7. Done ───────────────────────────────────────────────────
echo ""
echo "=== Setup complete ==="
echo ""
echo "Next steps:"
echo "  1. Open Ghostty (install from https://ghostty.org if needed)"
echo "  2. Tmux plugins are installed - press Ctrl+A then Shift+I inside tmux to verify"
echo "  3. Open a new terminal to let shell init scripts generate caches"
echo "  4. Run 'atuin login' if you want to sync shell history"
