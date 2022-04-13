let mapleader = " "
filetype plugin on
source ~/.vim/plug.vim

  "____                           _ 
 "/ ___| ___ _ __   ___ _ __ __ _| |
"| |  _ / _ \ '_ \ / _ \ '__/ _` | |
"| |_| |  __/ | | |  __/ | | (_| | |
 "\____|\___|_| |_|\___|_|  \__,_|_|
syntax on
set encoding=UTF-8
set mouse=nv
set number
set relativenumber
set scrolloff=8
set nu
set shiftwidth=2
set tabstop=2
set cursorcolumn
set cursorline
set signcolumn=yes
set timeoutlen=1000
set ttimeoutlen=5
set backspace=indent,eol,start
set colorcolumn=80
set splitright
set wildmenu
set wildmode=longest,list,full
set clipboard^=unnamed,unnamedplus

 "_  __                                      _                 
"| |/ /___ _   _ _ __ ___   __ _ _ __  _ __ (_)_ __   __ _ ___ 
"| ' // _ \ | | | '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` / __|
"| . \  __/ |_| | | | | | | (_| | |_) | |_) | | | | | (_| \__ \
"|_|\_\___|\__, |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
          "|___/                |_|   |_|            |___/     
"General
""Toggle mouse mode
noremap <leader>m <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>
""Move the current buffer from a split pane to a new tab
nnoremap <leader>nt <C-w><S-t>
""Yank if Ctrl + c is pressed
noremap <C-c> y
""Escape insert mode by pressing
imap § <ESC>
""Search with * for word under cursor without jump and with wordcount
nnoremap <expr> * ':%s/'.expand('<cword>').'//gn<CR>``'
""Remap <C-w> to <C-z> in insert mode to delete the written text
inoremap <C-z> <C-w>
""Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
"Plugins
""FZF
nnoremap ; :FZF<cr>
let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
""Ack.vim
nnoremap , :Ag<cr>
""Coc + Native LSP TODO
let g:coc_start_at_startup = has('nvim') ? (v:false) : (v:true)
nnoremap <leader>a :CocAction<cr>
nnoremap <leader>t :call ToggleRustTypeHints()<cr>
nnoremap <leader>gd :call CocAction('jumpDefinition')<cr>
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
nmap <leader>rn <Plug>(coc-rename)
"inoremap <silent> <leader>a <C-r>=CocActionAsync('showSignatureHelp')<CR>
""Coc-Explorer
nnoremap <F2> :CocCommand explorer<CR>
""Obsession
noremap <leader>s :Obsess<cr>
""Gitgutter
nnoremap <leader>gg :GitGutterToggle<cr>
""Vimspector
nmap <leader>dd :!cargo build<cr> <bar> :call vimspector#Launch()<cr>
nmap <leader>dx :VimspectorReset<CR>
"nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
""Function Keymappings
nnoremap <leader>fl :call WordToFiglet()<cr>
nnoremap <leader>de :call TranslateToGerman()<cr>
nnoremap <leader>en :call TranslateToEnglish()<cr>
vnoremap <leader>de :call TranslateToGerman()<cr>
vnoremap <leader>en :call TranslateToEnglish()<cr>
""Faster scroll
""" Note: Shift + J is normally move line under current line to this line
"""       Shift + J is now remapped to jd (d for down (one line))
noremap <leader>jd <S-j>
noremap <S-k> 10k
noremap <S-j> 10j
noremap <S-h> 10h
noremap <S-l> 10l
""Easy Brackets
"inoremap { {}<Left><Cr><ESC><S-O>
"inoremap {<CR> {}<Left><Cr><ESC><S-O>
"inoremap {} {}
"inoremap ( ()<Left>
"inoremap () ()
"inoremap [ []<Left>
"inoremap [] []
"autocmd FileType html          inoremap <buffer> < <
"inoremap < <><Left>
"inoremap <<space> <<space>
"inoremap <= <=
"inoremap <> <>

 "____  _             _           
"|  _ \| |_   _  __ _(_)_ __  ___ 
"| |_) | | | | |/ _` | | '_ \/ __|
"|  __/| | |_| | (_| | | | | \__ \
"|_|   |_|\__,_|\__, |_|_| |_|___/
               "|___/             
"Coc
let g:coc_global_config="$HOME/.vim/coc-settings.json"

"Coc Explorer
"" Disable netrw
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_matchit = 1
"" Startup
"autocmd VimEnter * ++nested call <SID>coc_explorer#open_explorer(1, {'name':'left'}, {})
"autocmd VimEnter * :tabdo CocCommand explorer
"autocmd WinNew * :CocCommand explorer
"autocmd TabEnter * if (!exists('*coc_explorer#open_explorer')) | :CocCommand explorer | endif
"autocmd BufWinLeave * :if (winnr("$") == 1) | q | endif
"Wait for official :mksession support: https://github.com/weirongxu/coc-explorer/issues/297
"autocmd VimEnter * :CocCommand explorer
"autocmd TabNew * :CocCommand explorer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

"Obsession
set sessionoptions+=winpos
set sessionoptions+=terminal
set sessionoptions+=resize
set sessionoptions+=tabpages
function! AirlineInit()
    let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''S'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

"FZF
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

"Gitgutter
autocmd VimEnter * GitGutterDisable

"Vimspector
let g:vimspector_sidebar_width = 80
let g:vimspector_bottombar_height = 15
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'CodeLLDB' ]

"Gruvbox
if !has("nvim")
	set term=xterm
	set t_Co=256
endif
set termguicolors
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
let g:gruvbox_termcolors = '256'
colorscheme gruvbox

"Airline
let g:airline#extensions#tabline#enabled = 1
if has("nvim")
	let g:airline#extensions#tabline#enabled = 0
endif
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" air-line
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#branch#enabled=1
let g:airline_symbols.space = "\ua0"
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"vim-oscyank
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | OSCYankReg " | endif

"Rust
let g:rust_recommended_style = 0
autocmd BufNewFile,BufRead *.rs set filetype=rust

"" Rusty-tags (this causes the buffer to redraw)
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

  "__                  _   _                 
 "/ _|_   _ _ __   ___| |_(_) ___  _ __  ___ 
"| |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
"|  _| |_| | | | | (__| |_| | (_) | | | \__ \
"|_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
function! WordToFiglet()
	if executable('figlet')
		let l:line=getline('.')
		silent execute '.!figlet "'.l:line.'"'
	endif
endfunction
function! TranslateToEnglish()
	if executable('trans')
		let l:line = getline('.')
		let l:res = system('trans -b de: "'.l:line.'" | tail -n 1 | sed "s/^ *//g" | perl -pe "s/\e\[[0-9;]*m(?:\e\[K)?//g"')
		call setline('.', l:res)
		normal $x
	endif
endfunction
function! TranslateToGerman()
	if executable('trans')
		let l:line = getline('.')
		let l:res = system('trans -b :de "'.l:line.'" | tail -n 1 | sed "s/^ *//g" | perl -pe "s/\e\[[0-9;]*m(?:\e\[K)?//g"')
		call setline('.', l:res)
		normal $x
	endif
endfunction
function! ToggleRustTypeHints()
	" https://github.com/neoclide/coc.nvim/blob/release/doc/coc.txt (line 3116)
	let inlayHints = 'rust-analyzer.inlayHints'
	call coc#config(inlayHints . '.typeHints', !coc#util#get_config(inlayHints).typeHints)
	call feedkeys("\<y>")
	"call timer_start(200, { tid -> execute('feedkeys("\<y>")') })
	call coc#config(inlayHints . '.chainingHints', !coc#util#get_config(inlayHints).chainingHints)
	call feedkeys("\<y>")
endfunction
