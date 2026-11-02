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

This repository uses a bare Git repository setup, tracking dotfiles directly from `$HOME` without symlinks:


```bash
~
├── .config/
│   ├── git/              # Git configuration and ignore settings
│   ├── iterm2/            # iTerm2 terminal preferences
│   └── raycast/          # Raycast launcher extensions and configuration
├── .zprofile             # Environment variables and login shell setup
├── .zshrc                # Interactive Zsh configuration, aliases, and prompts
├── LICENSE               # License terms
└── README.md             # Repository documentation
```


