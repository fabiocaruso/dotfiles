# Configuration
A Repository for all my workspace configuration files.

# Usage
You need Neovim with Python support and some dependencies for YCM Plugin

```sudo apt install vim-nox build-essential cmake python3-dev```

Clone with

```git clone --recurse-submodules -j8 https://github.com/fabiocaruso/configuration.git ~/configuration```

Move files to homefolder

```rm -Rf ~/configuration/.git* ~/configuration/README.md; mv -f ~/configuration/{,.[^.]}* ~/; rm -Rf ~/configuration/```

Init YCM Plugin with clang and rust support

```cd ~/.vim/bundle/YouCompleteMe && ./install.py --cs-completer --rust-completer```
