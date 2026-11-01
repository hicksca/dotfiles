# dotfiles

A clean, modular, and opinionated collection of personal configuration files, developer environment setups, and shell utilities.

---

## Overview

This repository contains dotfiles designed to keep development environments consistent, lightweight, and fast across systems. Configurations are structured for easy auditing, customization, and symlinking.

### Highlights

- **Shell:** Zsh / Bash configurations with optimized prompt settings, history preservation, and performance-tuned aliases.
- **Terminal:** Modern terminal emulator configurations focused on readability, high contrast, and clean typography.
- **Editor:** Neovim / Vim configs with essential LSP scaffolding, keybindings, and lightweight plugin orchestration.
- **Git:** Sane defaults for diffs, log formatting, branching workflows, and global `.gitignore` rules.
- **Window Management / OS Defaults:** System tweaks and shortcuts to streamline navigation and workspace management.

---

## Structure

```text
dotfiles/
├── bin/            # Custom utility scripts and standalone executables
├── git/            # Git configuration (.gitconfig, .gitignore_global)
├── shell/          # Aliases, exports, functions, and prompt configuration
├── vim/            # Editor configuration and plugin definitions
├── install.sh      # Core setup / symlinking script
└── README.md       # Repository documentation
