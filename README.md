# Dotfiles

# Setup
## Symbolic links
A symbolic link is a special type of file that points to another file or directory.

`ln -s {source-filename} {symbolic-filename}`

Example: `ln -s ~/code/dotfiles/tmuxinator/rails.yml
~/.config/tmuxinator/rails.yml`

## Git
Create a file in `~/` called `.gitconfig_local` and add the values you don't want committed or made public in your .gitconfig file. In this case:

    [user]
          name = First Last
          email = email@example.com

# Programs
## Terminal emulator
[Alacritty](https://github.com/alacritty/alacritty) - A fast, cross-platform, OpenGL terminal emulator

Migrating from [iterm to Alacritty](https://medium.com/@pezcoder/how-i-migrated-from-iterm-to-alacritty-c50a04705f95)

## tmux
[tmux](https://github.com/tmux/tmux) is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen. tmux may be detached from a screen and continue running in the background, then later reattached.

> In addition to changing the prefix key, I also recommend remapping your caps lock key to act as a control key so that the tmux prefix can be pressed with your hands still on the home row. Use the following links to help configure this:
+ [OS X: Caps Lock to Control](https://stackoverflow.com/questions/162896/emacs-on-mac-os-x-leopard-key-bindings)

### Tmuxinator
[Tmuxinator](https://github.com/tmuxinator/tmuxinator) creates and manages tmux sessions easily.

## Vim
[Vim](https://github.com/vim/vim) is a highly configurable text editor built to make creating and changing any kind of text very efficient. It is included as "vi" with most UNIX systems and with Apple OS X.

Basic [tutorial](https://thoughtbot.com/upcase/onramp-to-vim)

## Command-line fuzzy finder
[fzf](https://github.com/junegunn/fzf) is a general-purpose command-line fuzzy finder.

`brew install fzf`

## File manager
[Vifm](https://vifm.info/) is a file manager with curses interface, which provides Vi[m]-like environment for managing objects within file systems.

`brew install vifm`

## Fonts
[Monoid](https://github.com/larsenwork/monoid)

## Process manager
[Overmind](https://github.com/DarthSim/overmind) is a process manager for Procfile-based applications and tmux.

