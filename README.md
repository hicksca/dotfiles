# dotfiles

Personal configuration for Zsh, Git, Neovim, and tmux on macOS.

## Structure

This repository is a bare Git repository that tracks files directly from `$HOME`, so there are no symlinks or install scripts. Only the files below are tracked; everything else in the home directory is ignored.

```
~
├── .config/
│   ├── git/      # Git configuration and global ignore rules
│   ├── nvim/     # Neovim configuration
│   └── tmux/     # tmux configuration
├── .zprofile     # Login environment: PATH, editor, local dirs, OrbStack
├── .zshrc        # Interactive shell: keybindings, aliases, completion
├── LICENSE
└── README.md
```

## What's configured

`.zprofile` runs once per login shell and sets up the environment. It creates `~/.local/bin` and `~/.local/src` if they are missing, puts `~/.local/bin` at the front of `PATH` so locally built tools take priority, sets `EDITOR` and `VISUAL` to Neovim (falling back to Vim), and loads OrbStack's shell integration when OrbStack is installed.

`.zshrc` runs for every interactive shell. It keeps emacs-style line editing (zsh would otherwise switch to vi mode because `EDITOR` is Vim), enables `auto_cd` so typing a directory path changes into it, and turns on zsh's completion system, which also completes SSH hosts from `~/.ssh/config`. It sets `GPG_TTY` so GPG can prompt for passphrases, defines the `dotfiles` and `tailscale` aliases, adds `~cgh` as a named directory for `~/code/github`, and loads iTerm2 shell integration when present.

`.config/nvim/init.lua` indents with 4 spaces, keeps undo history across sessions, shows line numbers in code files but not prose, and creates missing parent directories when saving a file to a new path. It also keeps Neovim's background transparent so the terminal's own background shows through, reapplying this whenever a colorscheme is loaded.

`.config/tmux/tmux.conf` keeps the default `Ctrl-b` prefix and adds mouse support, a 100,000 line scrollback, and window and pane numbering that starts at 1. Panes split with `|` and `-`, `w` opens a new window, and `n` renames the current one, with new panes and windows opening in the current directory.

Git does not set `core.editor`, so it follows `EDITOR`.

## Setup on a new machine

Clone the repository as a bare repo and define the `dotfiles` alias (it is also defined in `.zshrc`, so this is only needed for the first checkout):

```bash
git clone --bare git@github.com:hicksca/dotfiles.git $HOME/code/github/dotfiles
alias dotfiles='git --git-dir=$HOME/code/github/dotfiles --work-tree=$HOME'
dotfiles checkout
dotfiles config status.showUntrackedFiles no
```

If `checkout` fails because files like `.zshrc` already exist, move them out of the way and run it again. Then start a new login shell with `exec zsh -l`.

## Usage

Use `dotfiles` anywhere you would normally use `git`:

```bash
dotfiles status
dotfiles add ~/.zshrc
dotfiles commit
dotfiles push
```

## License

See [LICENSE](LICENSE)
