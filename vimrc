source ~/dotfiles/bundles.vim

set background=dark
" let g:solarized_visibility="low"
colorscheme solarized

" handled by vim-sleuth now?
set tabstop=3
set softtabstop=3
set shiftwidth=3

let php_sql_query=1

let g:syntastic_always_populate_loc_list = 1

set backupdir=~/vimtmp
set dir=~/vimtmp
set number
set relativenumber
set hlsearch
set cursorline
call togglebg#map("")
set guifont=Menlo\ Regular:h12
set hidden

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

runtime macros/matchit.vim

set smartcase
set ignorecase
set title
set wrap linebreak
set listchars=tab:▸\ ,trail:·
" Fix the & command in normal+visual modes {{{
nnoremap & :&&<Enter>
xnoremap & :&&<Enter>
" }}}

let mapleader = ","
noremap \ ,
nnoremap ' `
nnoremap ` '
set wildmode=list:longest
" tabularize both = an =>
map <leader>] :Tab /=>\=<CR>
nmap <silent> <leader>d <Plug>DashSearch
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>c yi'f'a => self::<ESC>"0pviwUA
nmap <leader>a yi'A => $args['0']F$
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

nnoremap <leader>u :GundoToggle<CR>
if has("autocmd")
	autocmd!
	autocmd bufwritepost .vimrc source $MYVIMRC
"	autocmd BufRead,BufNewFile *.tpl set filetype=smarty
	autocmd FileType php set commentstring=//\ %s
	autocmd BufWritePost *.php EnableFastPHPFolds
endif

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files=30000 
" Folding settings
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <silent> zx zx :EnableFastPHPFolds<CR>
set wildignore+=*/pear/*,*/Zend/*,*/EbatNs/*,*/angular-1.1.x/*,*/documentation/*,*/vendor/*
" Syntastic settings{{{
let g:syntastic_php_checkers = ['php']
" search .htaccess with Silver Searcher
let g:agprg="ag --column --hidden"

let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd FileType php setlocal omnifunc=phpcomplete#CompleteTags
imap <C-k>     <Plug>(neosnippet_expand_or_jump)

smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"}}}
" vim:ft=vim:foldmethod=marker
