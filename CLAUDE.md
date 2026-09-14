# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repo for macOS. Config files are symlinked from this repo into their expected locations (e.g., `ln -s ~/code/dotfiles/tmux.conf ~/.tmux.conf`). There is no install script — symlinks are created manually.

## Repository Structure

- `bash_profile` — Main shell config; sources `~/.{path,bash_prompt,exports,aliases,functions,extra}` from home directory
- `aliases` — Shell aliases (navigation, git, Rails, tmuxinator, ctags)
- `vim/vimrc` — Vim config (vim-plug, gruvbox theme, ALE linting, vim-rspec, fzf)
- `nvim/` — Neovim config (Lua-based, packer, LSP via mason/lspconfig)
- `tmux.conf` — Tmux config (prefix: `C-s`, gruvbox theme, vim-tmux-navigator, TPM plugins)
- `gitconfig` — Git config (delta pager, aliases); user info loaded from `~/.gitconfig_local`
- `alacritty.toml` — Terminal emulator config (TOML; YAML support was dropped upstream)
- `tmuxinator/` — Session templates (`rails.yml` takes a project name arg, `dotfiles.yml`)
- `bin/tat` — Script to attach/create tmux session named after current directory

## Key Conventions

- **Editor**: Vim (primary), Neovim (secondary Lua-based config)
- **Vim leader key**: Space
- **Tmux prefix**: `C-s` (not the default `C-b`)
- **Indentation**: 2 spaces (tabs expanded)
- **Color scheme**: Gruvbox dark throughout (vim, tmux, lightline/lualine)
- **Git pager**: delta with custom decorations theme
- **Shell**: Bash (not zsh), with Homebrew on Apple Silicon (`/opt/homebrew`)
- **Ruby tooling**: rbenv, bundler; linting via rubocop (through ALE in vim)
- **Node tooling**: nvm with auto-switching via `.nvmrc` detection in `PROMPT_COMMAND`

## When Editing Dotfiles

- Vim config uses folding with `{{{`/`}}}` markers — preserve these when editing `vimrc`
- The `gitconfig` deliberately excludes user name/email — those live in `~/.gitconfig_local`
- Tmux uses vim-tmux-navigator for seamless `C-h/j/k/l` pane/split navigation
- Neovim plugin setup is in `nvim/lua/plugins-setup.lua` (packer); individual plugin configs are in `nvim/lua/plugins/`
