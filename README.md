# Configuration
A Repository for all my workspace configuration files.

# Usage
You need Neovim with Python support

```sudo apt install vim-nox```

Clone with

```git clone --recurse-submodules -j8 https://github.com/fabiocaruso/configuration.git ~/configuration```

move files to homefolder

```rm -Rf ~/configuration/.git* ~/configuration/README.md; mv -f ~/configuration/{,.[^.]}* ~/; rm -Rf ~/configuration/```
