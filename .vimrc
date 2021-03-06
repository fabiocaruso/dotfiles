"Vundle
set nocompatible
filetype off
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdTree'
Plugin 'itchyny/lightline.vim'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'dense-analysis/ale'
Plugin 'rust-lang/rust.vim'
call vundle#end()

"Keymappings
let mapleader = " "
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>t :tabnew<CR>
map <leader>q :q<CR>
map <leader>n :NERDTree<CR>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
nnoremap <silent><leader>gd :YcmCompleter GetDoc<CR>
""Escape insert mode by pressing
imap § <ESC>
""YouCompleteMe FixIt with F9 Key
map <F9> :YcmCompleter FixIt<CR>
""Faster scroll
noremap <S-k> 10k
noremap <S-j> 10j
noremap <S-h> 10h
noremap <S-l> 10l

"General
set number
set scrolloff=8
set relativenumber
set nu
set cursorcolumn
set cursorline
set signcolumn=yes
set timeoutlen=1000
set ttimeoutlen=5
set backspace=indent,eol,start
set tabstop=4      " To match the sample file
set shiftwidth=4
set noexpandtab    " Use tabs, not spaces
%retab!            " Retabulate the whole file

"lightline
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
colorscheme onehalfdark
let g:lightline.colorscheme='onehalfdark'

"nerdtree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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

"Rust
let g:rust_recommended_style = 0
autocmd BufNewFile,BufRead *.rs set filetype=rust
