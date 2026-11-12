# dotfiles

Personal configuration for Zsh and Git on macOS.

## Structure

This repository is a bare Git repository that tracks files directly from `$HOME`, so there are no symlinks or install scripts. Only the files below are tracked; everything else in the home directory is ignored.

```
~
├── .config/
│   └── git/      # Git configuration and global ignore rules
├── .zprofile     # Environment variables and login shell setup
├── .zshrc        # Interactive Zsh configuration, aliases, and prompt
├── LICENSE
└── README.md
```

## Setup on a new machine

Clone the repository as a bare repo and define the `dotfiles` alias (it is also defined in `.zshrc`, so this is only needed for the first checkout):

```bash
git clone --bare git@github.com:hicksca/dotfiles.git $HOME/code/github/dotfiles
alias dotfiles='git --git-dir=$HOME/code/github/dotfiles --work-tree=$HOME'
dotfiles checkout
dotfiles config status.showUntrackedFiles no
```

If `checkout` fails because files like `.zshrc` already exist, move them out of the way and run it again.

## Usage

Use `dotfiles` anywhere you would normally use `git`:

```bash
dotfiles status
dotfiles add ~/.zshrc
dotfiles commit -m "update zsh config"
dotfiles push
```

## License

See [LICENSE](LICENSE).
