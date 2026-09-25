#!/usr/bin/env bash
#
# Set up these dotfiles on a macOS machine. Safe to re-run: every step
# checks for its own result first, and anything already in the right place
# is left alone.
#
#   ./install.sh            # link dotfiles, then print what else to do
#   ./install.sh --brew     # also run `brew bundle`
#   ./install.sh --all      # --brew plus tpm, vim-plug, and the login shell
#
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
DO_BREW=0
DO_EXTRAS=0

for arg in "$@"; do
  case "$arg" in
    --brew) DO_BREW=1 ;;
    --all)  DO_BREW=1; DO_EXTRAS=1 ;;
    -h|--help) sed -n '2,10p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "unknown option: $arg (try --help)" >&2; exit 1 ;;
  esac
done

info() { printf '  %s\n' "$*"; }
step() { printf '\n==> %s\n' "$*"; }

# link <repo-relative source> <absolute destination>
link() {
  local src="$DOTFILES/$1" dst="$2"

  if [ ! -e "$src" ]; then
    info "SKIP  $2 (missing in repo: $1)"
    return
  fi

  # Already pointing where we want it.
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    info "ok    ${dst/#"$HOME"/\~}"
    return
  fi

  mkdir -p "$(dirname "$dst")"

  # Move anything real out of the way rather than destroying it. A symlink
  # that points somewhere else is replaced without ceremony.
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mkdir -p "$BACKUP"
    mv "$dst" "$BACKUP/"
    info "moved existing ${dst/#"$HOME"/\~} to ${BACKUP/#"$HOME"/\~}/"
  fi

  ln -sfn "$src" "$dst"
  info "link  ${dst/#"$HOME"/\~} -> $1"
}

step "Linking dotfiles"
link aliases                 "$HOME/.aliases"
link bash_prompt             "$HOME/.bash_prompt"
link fzf.bash                "$HOME/.fzf.bash"
link gitconfig               "$HOME/.gitconfig"
link gitignore               "$HOME/.gitignore"
link git_template            "$HOME/.git_template"
link tmux.conf               "$HOME/.tmux.conf"
link vim/vimrc               "$HOME/.vimrc"
link tmuxinator/dotfiles.yml "$HOME/.config/tmuxinator/dotfiles.yml"
link tmuxinator/rails.yml    "$HOME/.config/tmuxinator/rails.yml"

# Disabled on Linux: the macOS-era files in this repo don't match the
# Omarchy setup. Migrate the Linux versions into the repo before re-enabling.
# link bash_profile            "$HOME/.bash_profile"
# link nvim                    "$HOME/.config/nvim"
# link alacritty.toml          "$HOME/.config/alacritty/alacritty.toml"

# Omarchy / Linux desktop configs (whole dirs).
link config/hypr             "$HOME/.config/hypr"
link config/starship.toml    "$HOME/.config/starship.toml"

step "Git identity"
# gitconfig deliberately carries no name/email; they live here and are not
# tracked, so a work machine and a personal one can differ.
if [ -f "$HOME/.gitconfig_local" ]; then
  info "ok    ~/.gitconfig_local exists"
else
  cat > "$HOME/.gitconfig_local" <<'LOCAL'
[user]
  name =
  email =
LOCAL
  info "created ~/.gitconfig_local - fill in name and email"
fi

if [ "$DO_BREW" -eq 1 ]; then
  step "Homebrew packages"
  if command -v brew > /dev/null 2>&1; then
    brew bundle --file="$DOTFILES/Brewfile"
  else
    info "Homebrew not installed. See https://brew.sh, then re-run."
  fi
fi

if [ "$DO_EXTRAS" -eq 1 ]; then
  step "tmux plugin manager"
  if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    info "ok    ~/.tmux/plugins/tpm exists"
  else
    git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    info "cloned tpm - press prefix + I inside tmux to install plugins"
  fi

  step "vim-plug"
  if [ -f "$HOME/.vim/autoload/plug.vim" ]; then
    info "ok    vim-plug installed"
  else
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    info "installed vim-plug - run :PlugInstall in vim"
  fi

  step "Login shell"
  BREW_BASH="$(brew --prefix 2>/dev/null)/bin/bash"
  if [ ! -x "$BREW_BASH" ]; then
    info "Homebrew bash not found; skipping."
  elif [ "$SHELL" = "$BREW_BASH" ]; then
    info "ok    already $BREW_BASH"
  else
    # Both steps need a password, so ask rather than surprise the user.
    info "Login shell is $SHELL, not $BREW_BASH."
    info "To switch (needs sudo):"
    info "  echo '$BREW_BASH' | sudo tee -a /etc/shells"
    info "  chsh -s '$BREW_BASH'"
  fi
fi

step "Done"
[ -d "$BACKUP" ] && info "Replaced files are in ${BACKUP/#"$HOME"/\~}/"
cat <<'NEXT'
  Not handled here, by design:
    - nvm       https://github.com/nvm-sh/nvm   (its installer edits shell rc files)
    - rubies    rbenv install <version>
    - fonts     Monoid is referenced by vimrc's guifont and is not on Homebrew
NEXT
