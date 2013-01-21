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

Bundle 'git://git.wincent.com/command-t.git'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'Lokaltog/vim-easymotion'
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

set number
set ruler
set bs=2
set list
set listchars=tab:→\ ,eol:¬
set history=1000
set splitright

nnoremap <leader>n :NERDTree .<CR>
nnoremap <silent> <S-r> :CommandT<CR>
