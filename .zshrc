export PATH="$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)
alias dotfiles="git --git-dir=\$HOME/code/github/dotfiles --work-tree=\$HOME"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias tailscale="tailscale --socket=/var/run/tailscaled.socket"
