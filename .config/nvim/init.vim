" Be iMproved dammit
let &t_ut=''
set nocompatible
filetype off
set noswapfile
set clipboard=unnamedplus

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" code
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" navigation
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" visual
Plug 'morhetz/gruvbox'

call plug#end()
filetype plugin indent on

" colors
syntax on
syntax enable
set background=dark
colorscheme gruvbox
set termguicolors

" nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
let g:nvim_tree_hide_dotfiles = 0

" navigate buffers
nnoremap <silent> H :bprev<CR>
nnoremap <silent> L :bnext<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <CR> o<ESC>

" tab setup
:set cindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" highlight cursor line
set cursorline

" show linenumbers
:set number
:set relativenumber

" keep cursor away from edge
set so=15

" map leader to ,
:let mapleader = ","
:let maplocalleader = ","

" dont auto // comment 
au FileType * setlocal comments-=:// comments+=f://

" map space to write
:map <space> :w<CR>
