# Add `~/bin` to the `$PATH`
export PATH="$HOME/code/dotfiles/bin:$PATH";

export EDITOR="vim";
export BASH_SILENCE_DEPRECATION_WARNING=1

export MANPGER="sh -c 'col -bx | bat -l man -p'"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH" # keg-only: psql, pg_config
export PATH="/opt/homebrew/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Run 'nvm use' automatically every time there's
# a .nvmrc file in the directory. Also, revert to default
# version when entering a directory without .nvmrc

enter_directory() {
if [[ $PWD == $PREV_PWD ]]; then
    return
fi
PREV_PWD=$PWD
if [[ -f ".nvmrc" ]]; then
    nvm use
    NVM_DIRTY=true
elif [[ $NVM_DIRTY = true ]]; then
    nvm use default
    NVM_DIRTY=false
fi
}

export PROMPT_COMMAND=enter_directory
### NVM

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# # Open new tab on working directory
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -n"

eval "$(rbenv init -)"
eval "$(zoxide init bash)"

# Git auto complete ---
# brew install bash-completion

# Enable tab completion for `g` by marking it as an alias for `git`
# Note: not working
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;
# --- Git auto complete

# View git diff with bat ---
gdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}
# --- View git diff with bat

. "$HOME/.cargo/env"

# Created by `pipx` on 2025-04-26 15:08:22
export PATH="$PATH:/Users/sergioalvarez/.local/bin"

# Added by Windsurf
export PATH="/Users/sergioalvarez/.codeium/windsurf/bin:$PATH"
