#         File: macos_dotfiles_install.sh
# Last Updated: 20210507
#       Author: Carl Hicks
#===========================================#


#!/usr/bin/env bash


if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "please make sure this is a macOS system"
    exit
fi


# Homebrew managed installs
brew bundle --file=$(PWD)/homebrew/Brewfile
