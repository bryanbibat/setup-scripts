let mapleader="\<Space>"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'bzx/vim-theme-pack'
Bundle 'altercation/vim-colors-solarized'
Bundle '29decibel/codeschool-vim-theme'
Bundle 'ap/vim-css-color'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'

Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Valloric/YouCompleteMe'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'

syntax on
set ts=2 sts=2 sw=2 expandtab
filetype plugin indent on

set showmode

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

set nocompatible   
set laststatus=2   
set number
set ruler
set encoding=utf-8 
let g:Powerline_symbols = 'fancy'
set bs=2
set list
set listchars=tab:→\ ,eol:¬
set history=1000
set splitright

nnoremap <leader>n :NERDTree .<CR>
nnoremap <silent> <S-r> :CommandT<CR>
let g:CommandTMaxFiles=50000
