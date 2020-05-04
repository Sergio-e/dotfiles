# Dotfiles

# Setup
## Symbolic links
`ln -s {source-filename} {symbolic-filename}`

## Git
Create a file in `~/` called `.gitconfig_local` and add the values you don't want committed or made public in your .gitconfig file. In this case:

    [user]
          name = First Last
          email = email@example.com

## tmux
> In addition to changing the prefix key, I also recommend remapping your caps lock key to act as a control key so that the tmux prefix can be pressed with your hands still on the home row. Use the following links to help configure this:
+ [OS X: Caps Lock to Control](https://stackoverflow.com/questions/162896/emacs-on-mac-os-x-leopard-key-bindings)

## Command-line fuzzy finder
`brew install fzf`

## File manager
`brew install vifm`
