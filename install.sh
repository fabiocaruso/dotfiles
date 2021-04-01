#!/bin/bash

# Install script path
path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"

pprint() {
	tput setaf 2;
	echo "$1"
	tput sgr0
}
source_files_in() {
	local dir="$1"

	if [[ -d "$dir" && -r "$dir" && -x "$dir" ]]; then
		for file in "$dir"/*; do
			if [[ "$file" != "$path" ]]; then
				[[ -f "$file" && -r "$file" ]] && . "$file"
			fi
		done
	fi
}

pprint "Installation script for linux work environment"
pprint "Init.."

if [ "$OSTYPE" = "linux-gnu" ] ; then
	# Install dependencies
	sudo apt-get update
	sudo apt-get install libc-dev
	sudo apt-get install libc-dev
	sudo apt-get install git neovim python3-dev python3-pip python3-neovim curl build-essential cmake npm fzf silversearcher-ag ripgrep bat figlet translate-shell -y
	# Install Neovim dependencies
	pip3 install pynvim
	pip3 install --upgrade pynvim
	sudo npm install -g neovim
	# Check if dependencies installed correctly
	nvim +checkhealth
	# Clone dotfiles if it's missing
	git clone https://github.com/fabiocaruso/dotfiles.git ~/dotfiles
	rm -Rf ~/dotfiles/README.md && mv -f ~/dotfiles/{,.[^.]}* ~/
	rm -Rf ~/dotfiles/
	# Clone Vundle if it's missing
	mkdir ~/.vim/bundle/
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	source_files_in ~
	# Install plugins
	nvim -u ~/.vim/vundle.vim +PluginInstall +qall
elif [ "$OSTYPE" = "darwin" ] ; then
        # Mac OSX
	true
elif [ "$OSTYPE" = "cygwin" ] ; then
        # POSIX compatibility layer and Linux environment emulation for Windows
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
	cargo install git-delta rusty-tags
	git config --global core.pager "delta --line-numbers --dark"
	rustup component add clippy rust-src
	nvim "+CocInstall coc-rust-analyzer +CocInstall coc-rls +VimspectorInstall CodeLLDB --enable-rust" +qall
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

