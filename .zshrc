# Keep emacs-style line editing (zsh switches to vi mode when EDITOR is vim/nvim)
bindkey -e

# Change into a directory by typing its path, without cd
setopt auto_cd

# GPG needs to know which terminal to use for passphrase prompts.
# Set per shell, since each terminal window has its own TTY.
export GPG_TTY=$(tty)

# Enable zsh's completion system (includes SSH hosts from ~/.ssh/config)
autoload -Uz compinit && compinit

# Manage dotfiles via the bare repo, with $HOME as the work tree
dotfiles() {
  git --git-dir="$HOME/code/github/dotfiles" --work-tree="$HOME" "$@"
}

# Complete dotfiles like git, pointed at the bare repo
_dotfiles() {
  local -x GIT_DIR="$HOME/code/github/dotfiles" GIT_WORK_TREE="$HOME"
  service=git _git
}
compdef _dotfiles dotfiles

# Point the Tailscale CLI at the daemon socket (for the open-source tailscaled build)
alias tailscale="tailscale --socket=/var/run/tailscaled.socket"

# Named directory: use ~cgh as shorthand for ~/code/github
hash -d cgh=~/code/github

# Load iTerm2 shell integration if installed
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
