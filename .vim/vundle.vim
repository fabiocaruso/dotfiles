set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Themeing
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'
"Language specific
Plugin 'alvan/vim-closetag'
Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'rust-lang/rust.vim'
Plugin 'mattn/emmet-vim'
"Utility
Plugin 'lifepillar/vim-cheat40'
Plugin 'fadein/vim-FIGlet'
Plugin 'tpope/vim-obsession'
Plugin 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plugin 'ojroques/vim-oscyank'
"Debugger
Plugin 'puremourning/vimspector'
"Fuzzy finder
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-rooter'
Plugin 'mileszs/ack.vim'
"LSP
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
"Git
Plugin 'tpope/vim-fugitive'
Plugin 'https://github.com/airblade/vim-gitgutter.git'
"For better workflow
Plugin 'wellle/targets.vim'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'preservim/nerdcommenter'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'AndrewRadev/whitespaste.vim'
Plugin 'AndrewRadev/tagalong.vim'
Plugin 'AndrewRadev/id3.vim'
Plugin 'AndrewRadev/dsf.vim'
Plugin 'AndrewRadev/vim-jsonpath'
Plugin 'AndrewRadev/undoquit.vim'
Plugin 'AndrewRadev/ginitpull.vim'
Plugin 'AndrewRadev/deleft.vim'
" Out for now
"Plugin 'itchyny/lightline.vim'
"Plugin 'scrooloose/nerdTree'
" Plugin 'dense-analysis/ale'
"Plugin 'sonph/onehalf', { 'rtp': 'vim' }
call vundle#end()
filetype plugin indent on
