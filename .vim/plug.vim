let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
"Themeing
Plug 'morhetz/gruvbox'
if !has("nvim")
	Plug 'vim-airline/vim-airline'
	Plug 'ryanoasis/vim-devicons'
endif
"Language specific
Plug 'alvan/vim-closetag'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim'
"Utility
Plug 'lifepillar/vim-cheat40'
Plug 'fadein/vim-FIGlet'
Plug 'tpope/vim-obsession'
Plug 'ojroques/vim-oscyank'
"Debugger
if !has("nvim")
	Plug 'puremourning/vimspector'
endif
"Fuzzy finder
Plug 'airblade/vim-rooter'
if !has("nvim")
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'mileszs/ack.vim'
endif
"LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Git
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter.git'
"For better workflow
Plug 'wellle/context.vim'
Plug 'wellle/targets.vim'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'preservim/nerdcommenter'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/whitespaste.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'AndrewRadev/id3.vim'
Plug 'AndrewRadev/dsf.vim'
Plug 'AndrewRadev/vim-jsonpath'
Plug 'AndrewRadev/undoquit.vim'
Plug 'AndrewRadev/ginitpull.vim'
Plug 'AndrewRadev/deleft.vim'
call plug#end()
