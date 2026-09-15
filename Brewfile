# Brewfile - install with `brew bundle` from this directory.
#
# Scope: only what these dotfiles actually reference. Anything else that
# happens to be installed on a given machine is deliberately left out, so
# `brew bundle cleanup` stays meaningful. Regenerate deliberately, not with
# `brew bundle dump` - that pulls in every leaf and undoes the curation.

tap "homebrew/bundle"

# Shell -----------------------------------------------------------------
# bash 5.x; the login shell per CLAUDE.md. macOS still ships bash 3.2.
brew "bash"
brew "bash-completion@2"

# Core CLI --------------------------------------------------------------
brew "git"                  # newer than Xcode's, and gitconfig assumes it
brew "git-delta"            # gitconfig: core.pager = delta
brew "the_silver_searcher"  # `ag`; vimrc grepprg + FZF_DEFAULT_COMMAND
brew "fzf"                  # fzf.bash, and the vim fzf plugin
brew "zoxide"               # bash_profile: eval "$(zoxide init bash)"
brew "eza"                  # aliases: ls / l / la / lsd
brew "bat"                  # bash_profile: MANPAGER
brew "sd"
brew "tldr"
brew "bottom"
brew "glow"
brew "httpie"

# Editor / terminal / multiplexer ---------------------------------------
brew "vim"                  # primary editor; ~/.vimrc -> vim/vimrc
brew "tmux"                 # tmux.conf, prefix C-s
brew "tmuxinator"           # tmuxinator/*.yml
brew "vifm"
brew "universal-ctags"      # aliases `cctags`, git_template/hooks/ctags
cask "alacritty"            # alacritty.toml
cask "font-fira-code-nerd-font"  # the font alacritty.toml asks for

# Git UI ----------------------------------------------------------------
brew "lazygit"

# Ruby / Rails ----------------------------------------------------------
brew "rbenv"                # bash_profile: eval "$(rbenv init -)"
brew "overmind"             # aliases: `ov`
brew "postgresql@17"        # keg-only; bash_profile puts its bin on PATH
