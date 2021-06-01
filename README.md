# Dotfiles
A Repository for all my workspace configuration files.

# Requirements
- For full feature support you need Neovim > 0.4.3.
- Vim > 8.0 is also supported but limited.
- A Terminal with OSC52 (clipboard) support [supported terminals](https://github.com/ojroques/vim-oscyank)
- A patched nerd font installed in the terminal emulator [fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts)

Notes:
The install script should install the latest version of Neovim.
If you have another version installed or a custom ppa as source
delete it first before you run the install script

# Installation
Just download install.sh and run it:

```cd ~ && . <(curl -s https://raw.githubusercontent.com/fabiocaruso/dotfiles/master/install.sh)```

# Update
If you update Neovim make sure you also upgrade pynvim:

```pip2 install --upgrade pynvim```

or

```pip3 install --upgrade pynvim```

or if you installed it over apt:

```sudo apt install python3-neovim```

Update Plugins (in vim):

```:PluginUpdate```

# Usage
TODO

<del>
# Usage
You need Neovim with Python support and some dependencies for YCM Plugin

```sudo apt install vim-nox build-essential cmake python3-dev```

Clone with

```git clone --recurse-submodules -j8 https://github.com/fabiocaruso/dotfiles.git ~/dotfiles```

Move files to homefolder

```rm -Rf ~/dotfiles/README.md && mv -f ~/dotfiles/{,.[^.]}* ~/; rm -Rf ~/dotfiles/```

Install Vundle Packages

```vim +PluginInstall +qall```

Init YCM Plugin with clang and rust support

```cd ~/.vim/bundle/YouCompleteMe && ./install.py --cs-completer --rust-completer```
</del>
