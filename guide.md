# Terminal User Guide

## What's Running and Why

When you open Ghostty, here's what loads:

```
Ghostty (the window)
  └── Tmux (multiplexer — splits, tabs, sessions)
        └── Fish (the shell — where you type commands)
              └── Starship (the colorful prompt line you see)
```

### The Prompt Explained

Your prompt looks something like:

```
  ~ ❯                                        19:45
│ │ │ │                                       │  │
│ │ │ └── green = last command succeeded      │  └── current time
│ │ │     red = last command failed           └── clock icon
│ │ └── directory (in a blue pill)
│ └── (pill separator)
└── Apple icon
```

In a git repo, a purple pill appears:

```
  ~/project   main ~2 +1 ❯
              │     │   │
              │     │   └── 1 staged file
              │     └── 2 modified files
              └── branch name in purple pill
```

---

## Daily Workflows

### Moving Around

```bash
# Go to a directory
cd ~/agentland

# Or use zoxide — just type part of the name
z agent        # jumps to ~/agentland (or wherever you go most)
z straddle     # jumps to straddle-github

# Go back
z -

# List files
l              # long list with git info
ll             # same but shows hidden files
lt             # tree view — great for seeing project structure
```

### Autocomplete (carapace)

Your shell has smart tab-completion for thousands of commands. Just press `Tab`.

```bash
git sta<Tab>          # shows: stage, stash, status (with descriptions)
brew ins<Tab>         # shows: install, info, instal...
docker run --<Tab>    # shows all flags for 'docker run'
```

Autocomplete uses **fuzzy matching** — you don't need to type the exact start:
```bash
git cmit<Tab>         # still finds "commit" because fuzzy matches c-m-i-t
```

It works for:
- Subcommands (`git`, `brew`, `docker`, `npm`, `cargo`, etc.)
- Flags and options (`--verbose`, `--help`, etc.)
- File paths
- Even your aliases

If completion doesn't appear, press `Tab` a second time or try `Ctrl+N` for the IDE-style popup with descriptions.

### Reading Files

```bash
# bat = cat with syntax highlighting and line numbers
cat somefile.py        # actually runs bat

# Scroll a long file
cat somefile.py | less
```

### Git Basics

```bash
gst                    # check status — what changed?
gdiff                  # see actual changes (side-by-side via delta)
ga                     # interactively stage changes (y/n per chunk)
gc "fix login bug"     # commit with message
gp                     # push to remote
glog                   # visual branch/commit history
```

### Using Tmux (Split Screen)

Tmux is already running when you open Ghostty. The status bar at the top shows your windows.

Tmux uses a **prefix key**: press `Ctrl+A`, release, then press the action key.

**Most common actions:**
```
Ctrl+A  v        → split pane side-by-side
Ctrl+A  s        → split pane top/bottom
Ctrl+A  h/j/k/l  → move between panes (vim-style)
Ctrl+A  z        → make pane fullscreen (toggle)
Ctrl+A  c        → close current pane

Ctrl+A  Ctrl+C   → new window (tab)
Ctrl+A  1-9      → jump to window by number
Ctrl+A  H / L    → previous / next window

Ctrl+A  [        → enter scroll mode (then j/k to scroll, / to search, q to exit)
```

To detach (keeps session alive): `Ctrl+A  Ctrl+D`
To reattach later: `tmux attach`

### Command History

Just start typing and press `Up` — Atuin shows matching history.

Or press `Ctrl+R` for a full interactive search across your history.

### Finding Files

```bash
# fzf fuzzy finder
Ctrl+T         # find a file, inserts the path

# Inside Nushell
ls **/*.py     # find all Python files recursively
```

---

## The Vi Mode Thing

Your shell is in **vi mode**. This means:

- **You start in Insert mode** — just type normally
- If you press `Escape`, you enter **Normal mode** — now h/j/k/l move your cursor like in vim
- Press `i` to go back to Insert mode and keep typing
- If your cursor stops responding to typing, you probably hit Escape — just press `i`

**You can mostly ignore vi mode** — just type normally and use Tab for completions. The only time it matters is if you accidentally hit Escape.

---

## Nushell vs Traditional Shells

Nushell is different from bash/zsh in a few ways:

| Traditional (bash/zsh) | Nushell |
|------------------------|---------|
| `echo $HOME` | `$env.HOME` |
| `export FOO=bar` | `$env.FOO = "bar"` |
| `cat file \| grep pattern` | `open file \| find pattern` |
| `if [ -f file ]` | `if ("file" \| path exists)` |
| `$(command)` | `(command)` |
| `&&` | `and` or `;` |

But most external commands (git, brew, curl, etc.) work exactly the same.

---

## Quick Troubleshooting

| Problem | Fix |
|---------|-----|
| Prompt looks broken | Open new tab: `Cmd+T` |
| Icons show as boxes/??? | Font isn't loaded — restart Ghostty |
| Config change not working | Nushell/Starship: open new tab. Ghostty: auto-reloads |
| Tmux status bar missing | Open new Ghostty window: `Cmd+N` |
| Can't scroll up | `Ctrl+A [` enters scroll mode, then `j/k`. Press `q` to exit |
