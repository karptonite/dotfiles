source ~/dotfiles/bundles.vim

set background=dark
let g:solarized_visibility="low"
colorscheme solarized

" handled by vim-sleuth now?
set tabstop=3
set softtabstop=3
set shiftwidth=3

let php_sql_query=1

set backupdir=~/vimtmp
set dir=~/vimtmp
set number
set hlsearch
call togglebg#map("")
set guifont=Menlo\ Regular:h12

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

runtime macros/matchit.vim

set smartcase
set ignorecase

" Fix the & command in normal+visual modes {{{2
nnoremap & :&&<Enter>
xnoremap & :&&<Enter>

" tabularize both = an =>
map <leader>] :Tab /=>\=<CR>
nmap <silent> <leader>d <Plug>DashSearch

autocmd FileType php set commentstring=//\ %s

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

let g:syntastic_php_checkers = ['php']
" search .htaccess with Silver Searcher
let g:agprg="ag --column --hidden"
