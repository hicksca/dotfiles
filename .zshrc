# Keep emacs-style line editing (zsh switches to vi mode when EDITOR is vim/nvim)
bindkey -e

# GPG needs to know which terminal to use for passphrase prompts.
# Set per shell, since each terminal window has its own TTY.
export GPG_TTY=$(tty)

# Manage dotfiles via the bare repo, with $HOME as the work tree
alias dotfiles="git --git-dir=\$HOME/code/github/dotfiles --work-tree=\$HOME"

# Point the Tailscale CLI at the daemon socket (for the open-source tailscaled build)
alias tailscale="tailscale --socket=/var/run/tailscaled.socket"

# Load iTerm2 shell integration if installed
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
