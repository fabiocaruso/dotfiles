#!/bin/bash

pprint() {
	tput setaf 2;
	echo "$1"
	tput sgr0
}

# Install dependencies based on current distribution and package managers
fetch_distro() {
	if [ -f /etc/os-release ]; then
		# freedesktop.org and systemd
		. /etc/os-release
		OS=$NAME
		VER=$VERSION_ID
	elif type lsb_release >/dev/null 2>&1; then
		# linuxbase.org
		OS=$(lsb_release -si)
		VER=$(lsb_release -sr)
	elif [ -f /etc/lsb-release ]; then
		# For some versions of Debian/Ubuntu without lsb_release command
		. /etc/lsb-release
		OS=$DISTRIB_ID
		VER=$DISTRIB_RELEASE
	elif [ -f /etc/debian_version ]; then
		# Older Debian/Ubuntu/etc.
		OS=Debian
		VER=$(cat /etc/debian_version)
	elif [ -f /etc/SuSe-release ]; then
		# Older SuSE/etc.
		...
	elif [ -f /etc/redhat-release ]; then
		# Older Red Hat, CentOS, etc.
		...
	else
		# Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
		OS=$(uname -s)
		VER=$(uname -r)
	fi
}
install_deps() {
	fetch_distro
	# Install dependencies
	if [ "$OS" = "Solus" ]; then
		sudo eopkg it -c system.devel
		sudo eopkg it cmake rsync tmux vim neovim python3 python3-devel curl nodejs fzf ripgrep silver-searcher bat rlwrap translate-shell
		sudo snap install figlet
	elif [ "$OS" = "Ubuntu" ] || [ "$OS" = "Linux Mint" ]; then
		sudo add-apt-repository ppa:neovim-ppa/unstable
		sudo apt-get update
		sudo apt-get install build-essential cmake libc-dev -y
		sudo apt-get install rsync neovim python3-dev python3-pip python3-neovim curl npm fzf silversearcher-ag ripgrep bat figlet translate-shell tmux -y
	fi
}

pprint "Installation script for linux work environment"
pprint "Init.."

if [ "$OSTYPE" = "linux-gnu" ] ; then
	install_deps
	# Install Neovim dependencies
	pip3 install pynvim
	pip3 install --upgrade pynvim
	sudo npm install -g neovim
	# Check if dependencies installed correctly
	nvim +checkhealth
	# Clone dotfiles if it's missing
	git clone https://github.com/fabiocaruso/dotfiles ~/dotfiles
	rsync -va ~/dotfiles/ ~/
	rm -Rf ~/dotfiles/
	git config --global core.excludesfile ~/.gitignore_global
	# Clone Plug
	mkdir ~/.vim/plugged/
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# Clone Packer
	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 		~/.local/share/nvim/site/pack/packer/start/packer.nvim
	# Clone tmux plugin manager (tpm)
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	# Install plugins
	nvim -u ~/.vim/plug.vim +PlugInstall +qall
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	nvim "+CocInstall coc-explorer" +qall
	~/.tmux/plugins/tpm/scripts/install_plugins.sh
elif [ "$OSTYPE" = "darwin" ] ; then
        # Mac OSX
	true
elif [ "$OSTYPE" = "cygwin" ] ; then
        # POSIX compatibility layer and Linux environment emulation for Windows

	# Apply .gitignore_global on windows (https://stackoverflow.com/a/7335487)
	# git config --global core.excludesfile %USERPROFILE%\.gitignore_global
	true
elif [ "$OSTYPE" = "msys" ] ; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
	true
elif [ "$OSTYPE" = "win32" ] ; then
        # I'm not sure this can happen.
	true
elif [ "$OSTYPE" = "freebsd" ] ; then
        # ...
	true
else
        # Unknown.
	true
fi

setup_all() {
	rust_setup
}

rust_setup() {
	if ! command -v rustup &> /dev/null
	then
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain=nightly -y
		source "$HOME/.cargo/env"
	fi
	cargo install git-delta rusty-tags selene
	git config --global core.pager "delta --line-numbers --dark"
	rustup component add clippy rust-src
	nvim "+CocInstall coc-rust-analyzer coc-rls" "+VimspectorInstall CodeLLDB --enable-rust" +qall
}

pprint "Available language support: ['Rust', 'Go', 'Python', 'JavaScript', 'TypeScript', 'Markdown']"
pprint "Leave blank to install support for all languages."
pprint -n "Which languages do you need on this machine? [ENTER]:"
read -r langs
IFS=', ' read -r -a langs <<< "$langs"
if [ "${#langs[@]}" = "0" ] ; then
	pprint "Installing all languages.."
	setup_all
else
	for lang in "${langs[@]}"
	do
		case $lang in
			Rust*|rust*|RUST*) rust_setup ;;
			Go*|go*|GO*) echo go;;
			Python*|python*|PYTHON*) echo python ;;
			JavaScript*|Javascript*|javascript*|JAVASCRIPT*) echo JS ;;
			TypeScript*|Typescript*|typescript*|TYPESCRIPT*) echo TS ;;
			Markdown*|markdown*|MARKDOWN*) echo MD ;;
			*) pprint "Language $lang not supported" ;;
		esac
	done
fi

bash
