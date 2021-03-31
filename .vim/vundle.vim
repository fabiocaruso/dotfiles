set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'leafOfTree/vim-vue-plugin'
"Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdTree'
" Plugin 'dense-analysis/ale'
Plugin 'rust-lang/rust.vim'
Plugin 'mattn/emmet-vim'
Plugin 'preservim/nerdcommenter'
Plugin 'https://github.com/airblade/vim-gitgutter.git'
Plugin 'https://github.com/tpope/vim-surround.git'
"Plugin 'sonph/onehalf', { 'rtp': 'vim' }
Plugin 'puremourning/vimspector'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-rooter'
Plugin 'fadein/vim-FIGlet'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on
