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
set timeoutlen=1000
set ttimeoutlen=5
set backspace=indent,eol,start

"YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

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
"Open NERDTree on startup
autocmd VimEnter * NERDTree
"Open NERDTree on new tab
autocmd BufWinEnter * NERDTreeMirror
"Change focus to file on new tab
autocmd VimEnter * wincmd p
"Auto refresh NERDTree if :w executed
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
"Close vim if NERDTree is last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

"ALE
Plugin 'dense-analysis/ale'

"Rust
Plugin 'rust-lang/rust.vim'
autocmd BufNewFile,BufRead *.rs set filetype=rust
