# Multi-Machine Sync

This terminal setup is shared between two machines:
- **Local Mac** (primary development machine)
- **Mac Mini** (`mini` via Tailscale SSH)

## How it works

The `tgsync` fish alias handles push + sync in one command:

```
tgsync = git push origin HEAD && ssh mini 'cd /Users/js/projects/terminal-guide && git stash; git pull --ff-only; git stash pop 2>/dev/null; true'
```

1. Pushes current branch to origin
2. SSHs to mini
3. Stashes any local changes on mini (safety)
4. Pulls latest from origin (fast-forward only)
5. Re-applies stashed changes if any existed

## Full manual sync

If `tgsync` isn't enough (e.g., new plugins, first-time setup):

```bash
# From local
git push origin HEAD

# On mini
ssh mini
cd /Users/js/projects/terminal-guide
git pull --ff-only
./setup.sh

# Install tmux plugins on mini
TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins ~/.tmux/plugins/tpm/bin/install_plugins

# Reload tmux config on mini
tmux source-file ~/.config/tmux/tmux.conf
```

## Setting up a new remote machine

1. SSH into the machine
2. Clone the repo: `git clone https://github.com/hello-keith/terminal-guide.git /Users/js/projects/terminal-guide`
3. Run setup: `cd /Users/js/projects/terminal-guide && ./setup.sh`
4. Add the machine as a Tailscale node (for SSH access)
5. Add an SSH alias in `configs/config.fish` if desired

## Paths

| Machine | Repo path |
|---------|-----------|
| Local Mac | `~/projects/terminal-guide` (or wherever cloned) |
| Mac Mini | `/Users/js/projects/terminal-guide` |
