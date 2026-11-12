# dotfiles

Personal configuration for Zsh and Git on macOS.

## Structure

This repository is a bare Git repository that tracks files directly from `$HOME`, so there are no symlinks or install scripts. Only the files below are tracked; everything else in the home directory is ignored.

```
~
├── .config/
│   └── git/      # Git configuration and global ignore rules
├── .zprofile     # Login environment: PATH, editor, local dirs, OrbStack
├── .zshrc        # Interactive shell: keybindings, aliases, integrations
├── LICENSE
└── README.md
```

## What's configured

`.zprofile` runs once per login shell and sets up the environment. It creates `~/.local/bin` and `~/.local/src` if they are missing, puts `~/.local/bin` at the front of `PATH` so locally built tools take priority, sets `EDITOR` and `VISUAL` to Neovim (falling back to Vim), and loads OrbStack's shell integration when OrbStack is installed.

`.zshrc` runs for every interactive shell. It keeps emacs-style line editing (zsh would otherwise switch to vi mode because `EDITOR` is Vim), sets `GPG_TTY` so GPG can prompt for passphrases, defines the `dotfiles` and `tailscale` aliases, and loads iTerm2 shell integration when present.

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
