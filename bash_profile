# Add `~/bin` to the `$PATH`
export PATH="$HOME/code/dotfiles/bin:$PATH";

export EDITOR="vim";
export BASH_SILENCE_DEPRECATION_WARNING=1

# macOS hands us LC_CTYPE=UTF-8 but leaves LANG empty, so every other LC_*
# category has nothing to fall back to. bash-completion warns about
# LC_COLLATE on that. Set it before anything sources completions below.
export LANG="${LANG:-en_US.UTF-8}"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH" # keg-only: psql, pg_config

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

# Share history across panes: append this shell's new lines, then read
# what other shells have appended since the last prompt.
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a; history -n"

eval "$(rbenv init -)"
eval "$(zoxide init bash)"

# Enable tab completion for the `g` alias. Completing an alias needs
# __git_complete (from git's bash completion), not `complete -F _git`.
if declare -F __git_complete > /dev/null; then
	__git_complete g __git_main;
fi;

# View git diff with bat ---
gdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}
# --- View git diff with bat

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Created by `pipx` on 2025-04-26 15:08:22
export PATH="$PATH:/Users/sergioalvarez/.local/bin"

# Added by Windsurf
export PATH="/Users/sergioalvarez/.codeium/windsurf/bin:$PATH"
