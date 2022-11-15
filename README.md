# Dotfiles

# Setup
## Symbolic links
A symbolic link is a special type of file that points to another file or directory.

`ln -s {source-filename} {symbolic-filename}`

Example: `ln -s ~/code/dotfiles/tmuxinator/rails.yml
~/.config/tmuxinator/rails.yml`

## Git
Create a file in `~/` called `.gitconfig_local` and add the values you don't want committed or made public in your .gitconfig file. In this case:
```
    [user]
          name = First Last
          email = email@example.com
```

## Tools
- [Alacritty](https://github.com/alacritty/alacritty) - A fast, cross-platform, OpenGL terminal emulator
- [Vim](https://github.com/vim/vim) is a highly configurable text editor built to make creating and changing any kind of text very efficient.
- [tmux](https://github.com/tmux/tmux) is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen.
- [lazygit](https://github.com/jesseduffield/lazygit) simple terminal UI for git commands.
- [Overmind](https://github.com/DarthSim/overmind) is a process manager for Procfile-based applications and tmux.
- [Tmuxinator](https://github.com/tmuxinator/tmuxinator) creates and manages tmux sessions easily.
- [fzf](https://github.com/junegunn/fzf) is a general-purpose command-line fuzzy finder.
- [httpie](https://httpie.io/) is a command-line HTTP client.
- [Vifm](https://vifm.info/) is a file manager with curses interface, which provides Vi[m]-like environment for managing objects within file systems.
- [Maccy](https://github.com/p0deje/Maccy) is a lightweight clipboard manager for macOS.
- [tldr](https://github.com/tldr-pages/tldr) is a collection of community-maintained help pages for command-line tools.
- [ag](https://github.com/ggreer/the_silver_searcher) a code searching tool, with a focus on speed.
- [exa](https://github.com/ogham/exa) a modern replacement for `ls`.
- [bat](https://github.com/sharkdp/bat) a `cat` clone with syntax highlighting and Git integration.
- [sd](https://github.com/chmln/sd) is an intuitive find & replace CLI.
- [Delta](https://github.com/dandavison/delta) A syntax-highlighting pager for git, diff, and grep output
- [bottom](https://github.com/ClementTsang/bottom) a process/system visualization and management application.
- [glow](https://github.com/charmbracelet/glow) Render markdown on the CLI
- [BetterSnapTool](https://apps.apple.com/us/app/bettersnaptool/id417375580?mt=12) easy window resize & organize
- [Monoid](https://github.com/larsenwork/monoid) customisable coding font with alternates, ligatures and contextual positioning.

<!-- TODO: Add Notion, browser, etc. -->

## Other
### Tmux config
> In addition to changing the prefix key, I also recommend remapping your caps lock key to act as a control key so that the tmux prefix can be pressed with your hands still on the home row. Use the following links to help configure this:
+ [OS X: Caps Lock to Control](https://stackoverflow.com/questions/162896/emacs-on-mac-os-x-leopard-key-bindings)

### References
- [Upcase](https://thoughtbot.com/upcase/)
- [Command line tools](https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/)
- [Modern Unix](https://github.com/ibraheemdev/modern-unix)

