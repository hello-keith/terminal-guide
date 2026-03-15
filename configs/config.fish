# Fish Shell Config

# Suppress greeting
set -g fish_greeting

# Homebrew
fish_add_path /opt/homebrew/bin /opt/homebrew/sbin

# mise shims + local bin
fish_add_path $HOME/.local/share/mise/shims $HOME/.local/bin $HOME/.dotnet/tools

# Starship prompt
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source

# Zoxide (smart cd)
zoxide init fish | source

# Atuin (shell history)
atuin init fish | source

# fzf key bindings
fzf --fish | source

# Aliases
alias l "eza --long --header --git --icons=always"
alias ll "eza --long --header --git --all --icons=always"
alias lt "eza --long --header --git --all --tree --level=2 --icons=always"
alias c "clear"
alias cat "bat"
alias diff "delta"
alias agents "claude --teammate-mode tmux"
alias tailscale "/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias mini "mosh mini -- tmux new-session -A -s main"

# Git aliases
alias gc "git commit -m"
alias gca "git commit -a -m"
alias gp "git push origin HEAD"
alias gpu "git pull origin"
alias gst "git status"
alias glog "git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff "git diff"
alias gco "git checkout"
alias gb "git branch"
alias gba "git branch -a"
alias gadd "git add"
alias ga "git add -p"
alias gr "git remote"
alias gre "git reset"

# opencode
fish_add_path /Users/js/.opencode/bin
