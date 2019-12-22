"Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on

"General
set number

"lightline
Plugin 'itchyny/lightline.vim'
set laststatus=2
if !has('gui_running')
	set t_Co=256
endif

"lightline Colorpalette
let g:lightline = {
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \ },
      \ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

"OneHalf Color Scheme
syntax on
set t_Co=256
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
colorscheme onehalfdark
let g:lightline.colorscheme='onehalfdark'

"nerdtree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plugin 'scrooloose/nerdTree'
autocmd VimEnter * NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"ALE
Plugin 'dense-analysis/ale'
