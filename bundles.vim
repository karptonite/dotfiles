set nocompatible
filetype off

" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-commentary'
" Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
" Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

Bundle 'scrooloose/syntastic'
" Bundle 'scrooloose/nerdtree'
" Bundle 'Shougo/neocomplete.vim'
" Bundle 'Shougo/neosnippet.vim'
" Bundle 'Shougo/neosnippet-snippets'

Bundle 'airblade/vim-gitgutter'

Bundle 'kien/ctrlp.vim'

" for iTerm compatibility
" Bundle 'sjl/vitality.vim'
Bundle 'karptonite/vitality.vim'
Bundle 'godlygeek/tabular'

Bundle 'altercation/vim-colors-solarized'
Bundle 'nelstrom/vim-blackboard'

Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

" Custom textobjects
Bundle 'kana/vim-textobj-user.git'
" kana/vim-textobj-lastpat.git'
Bundle 'kana/vim-textobj-entire.git'
Bundle 'kana/vim-textobj-indent.git'
" Bundle 'kana/vim-textobj-syntax.git'
Bundle 'kana/vim-textobj-line.git'

Bundle 'rking/ag.vim'
" Autoclose is cool, but breaks undo :(
" Bundle 'townk/vim-autoclose'
filetype plugin indent on
