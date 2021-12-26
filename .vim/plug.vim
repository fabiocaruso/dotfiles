let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
"Themeing
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
if has("nvim")
	Plug 'nvim-treesitter/nvim-treesitter', { 'branch': '0.5-compat', 'do': ':TSUpdate' }
	Plug 'nvim-treesitter/playground'
	"Plug 'nvim-treesitter/nvim-treesitter-textobjects', { 'branch': '0.5-compat' }
	Plug 'fabiocaruso/nvim-treesitter-textobjects', { 'branch': '0.5-compat' }
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
if has("nvim")
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif
Plug 'ojroques/vim-oscyank'
"Debugger
Plug 'puremourning/vimspector'
"Fuzzy finder
Plug 'airblade/vim-rooter'
if has("nvim")
	Plug 'nvim-telescope/telescope-fzy-native.nvim'
	Plug 'nvim-telescope/telescope.nvim'
else
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
" Out for now
"Plug 'itchyny/lightline.vim'
"Plug 'scrooloose/nerdTree'
" Plug 'dense-analysis/ale'
"Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()
