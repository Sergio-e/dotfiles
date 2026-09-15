# Brewfile - install with `brew bundle` from this directory.
#
# Everything here is either referenced by these dotfiles or deliberately
# kept. Anything else that happens to be installed on a given machine is
# left out, so `brew bundle cleanup` stays meaningful. Regenerate by hand,
# not with `brew bundle dump` - that pulls in every leaf and undoes the
# curation.

tap "homebrew/bundle"
tap "anomalyco/tap"

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
brew "fd"
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

# Dev tooling -----------------------------------------------------------
brew "gh"
brew "lazygit"
brew "lefthook"
brew "mkcert"
brew "pandoc"
brew "typos-cli"
brew "sqlite-utils"
brew "oha"
brew "exercism"
brew "anomalyco/tap/opencode"
brew "pipx"                  # poetry and visidata live in pipx venvs

# Ruby / Rails ----------------------------------------------------------
brew "rbenv"                # bash_profile: eval "$(rbenv init -)"
brew "overmind"             # aliases: `ov`

# Databases -------------------------------------------------------------
brew "postgresql@17"        # keg-only; bash_profile puts its bin on PATH
brew "pgvector"
brew "libpq"                # keg-only, and overlaps postgresql@17's psql;
                            # kept for building pg client libs against
brew "redis"
brew "memcached"
brew "mongosh"

# Apps ------------------------------------------------------------------
cask "microsoft-word"
cask "drata-agent"
