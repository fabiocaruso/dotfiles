let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
"Themeing
Plug 'morhetz/gruvbox'
Plug 'rebelot/kanagawa.nvim'
if has("nvim")
	"Plug 'akinsho/bufferline.nvim'
	Plug 'nanozuki/tabby.nvim'
	Plug 'nvim-lua/lsp-status.nvim'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'mortepau/codicons.nvim'
else
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
if has("nvim")
	Plug 'theHamsta/nvim_rocks', {'do': 'pip3 install --user hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua'}
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif
Plug 'ojroques/vim-oscyank'
"Debugger
if has("nvim") == 0
Plug 'puremourning/vimspector'
endif
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
"Filetree
Plug 'kyazdani42/nvim-tree.lua'
"Treesitter
if has("nvim")
	Plug 'nvim-treesitter/nvim-treesitter', { 'branch': '0.5-compat', 'do': ':TSUpdate' }
	Plug 'nvim-treesitter/playground'
	"Plug 'nvim-treesitter/nvim-treesitter-textobjects', { 'branch': '0.5-compat' }
	Plug 'fabiocaruso/nvim-treesitter-textobjects', { 'branch': '0.5-compat' }
endif
"LSP
if has("nvim")
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'alexaandru/nvim-lspupdate'
	Plug 'ray-x/lsp_signature.nvim'
	Plug 'simrat39/rust-tools.nvim'
	Plug 'mfussenegger/nvim-dap'
	Plug 'rcarriga/nvim-dap-ui'
	Plug 'ldelossa/litee.nvim'
	Plug 'ldelossa/litee-symboltree.nvim'
	Plug 'ldelossa/litee-calltree.nvim'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'rafamadriz/friendly-snippets'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'onsails/lspkind-nvim'
	Plug 'wiliamks/nice-reference.nvim'
	Plug 'nvim-telescope/telescope-ui-select.nvim'
	Plug 'folke/trouble.nvim'
	Plug 'saecki/crates.nvim', { 'tag': 'v0.1.0' }
endif
"Git
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter.git'
if has("nvim")
	Plug 'lewis6991/gitsigns.nvim'
endif
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
