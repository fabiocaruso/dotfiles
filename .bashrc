# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
case "$OSTYPE" in
  linux*)   eval "`dircolors`" ;;
esac
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Convenience for cd ..
up ()
{
	DEEP=$1;
	[ -z "${DEEP}" ] && {
		DEEP=1
	};
	for i in $(seq 1 ${DEEP});
	do
		cd ../;
	done
}

# Git aliases
alias ga='git add '
alias gc='git commit -m '
alias gp='git push'
alias gs='git status'
alias gl='git log'
alias gr='git rebase -i '
alias gsu='git submodule update --recursive'
alias gsa='git submodule add '

# Needed to load .vimrc from ~ and not nvim's init.vim from ~/.config/nvim/
# Normally it needs to be -u but for some reason only -S works.
# alias vim='vim -S ~/.vimrc'
# alias nvim='nvim -u ~/.config/nvim/init.lua'

#WSL
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
#export DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0
export DISPLAY=:0
export LIBGL_ALWAYS_INDIRECT=1

export TERM=screen-256color
export PS1="[\[$(tput sgr0)\]\[\033[38;5;118m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\H]->{\[$(tput sgr0)\]\[\033[38;5;226m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]}:\[$(tput sgr0)\]"
source "$HOME/.cargo/env"

HM_SESSION_VARS="$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
if [ -f "$HM_SESSION_VARS" ]; then
	source $HM_SESSION_VARS
fi

export PATH=$PATH:~/.local/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
