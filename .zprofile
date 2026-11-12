# Ensure local install directories exist (new setups)
mkdir -p "$HOME/.local/bin" "$HOME/.local/src"

# Prefer locally built tools
typeset -U path
path=("$HOME/.local/bin" $path)

# Default editor: prefer Neovim, fall back to Vim
if (( $+commands[nvim] )); then
  export EDITOR=nvim VISUAL=nvim
elif (( $+commands[vim] )); then
  export EDITOR=vim VISUAL=vim
fi

# Load OrbStack shell integration if installed
if [[ -r ~/.orbstack/shell/init.zsh ]]; then
  source ~/.orbstack/shell/init.zsh
fi
