call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'Chiel92/vim-autoformat'
Plug 'karptonite/vim-sleuth'
Plug 'simnalamburt/vim-mundo'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/Align'
Plug 'bling/vim-airline'
Plug 'karptonite/phpfolding.vim'
Plug 'StanAngeloff/php.vim'
Plug 'chriskempson/base16-vim'
Plug 'rking/ag.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'thomwiggers/vim-colors-solarized' | Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
" Plug 'mattn/gist-vim'
Plug 'kshenoy/vim-signature'
Plug 'rizzatti/funcoo.vim' | Plug 'rizzatti/dash.vim'
Plug 'SirVer/ultisnips'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire' | Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-line'
Plug 'benekastah/neomake' 
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'flazz/vim-colorschemes'
Plug 'jgdavey/tslime.vim'
Plug 'wellle/targets.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'danro/rename.vim'

call plug#end()

syntax enable
set background=dark
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

let g:snips_author="Daniel Karp"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" " handled by vim-sleuth now?
set tabstop=3
set softtabstop=3
set shiftwidth=3

set tags=tags
set backupdir=~/vimtmp
set dir=~/vimtmp
set number
set relativenumber
set nostartofline
set hidden
set hlsearch 
call togglebg#map("")
set cursorline
set lazyredraw
set listchars=tab:▸\ ,trail:·
set scrolloff=2
set sidescrolloff=5
set fileformats+=mac
set smartcase
set ignorecase
set title
set wrap linebreak
set timeout
set timeoutlen=2000
set ttimeout
set ttimeoutlen=100

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1


"ctrlp settings {{{
" let g:ctrlp_show_hidden = 1
" let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" let g:ctrlp_max_files=30000 
" let g:ctrlp_open_new_file = 'h'
" let g:ctrlp_lazy_update = 1
" }}}
"Airline settings {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
"}}}
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:neomake_php_enabled_makers = ['php']

set wildignore+=*/pear/*,*/Zend/*,*/EbatNs/*,*/angular-1.1.x/*,*/documentation/*
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
set showcmd

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Fix the & command in normal+visual modes {{{
nnoremap & :&&<Enter>
xnoremap & :&&<Enter>
" }}}

" Dot command now works in visual mode
xnoremap . :normal .<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

let mapleader = ","
noremap \ ,
nnoremap ' `
nnoremap ` '

nnoremap <C-P> :Files<CR>
nnoremap <leader>b :Buffers<CR>

set wildmode=list:longest

" tabularize both = an =>
nmap <leader>= :Tab /=>\@!<CR>
nmap <Leader>] :Tab /=><CR>
vmap <leader>= :Tab /=>\@!<CR>
vmap <Leader>] :Tab /=><CR>
nmap <silent> <leader>d <Plug>DashSearch
nmap <leader>v :edit $MYVIMRC<CR>

" changes 'foo' to 'foo' => self::FOO
nmap <leader>c yi'f'a => self::<ESC>"0pviwUA

" changes foo to 'foo' => $args['foo'],
nmap <leader>a 0wyiwysiw'A => $args['0'],F$



nnoremap <BS> <C-^>

"Align array
nmap <silent> <leader>l :delmarks l<CR>0mlvi[<..........gv:s/\s\+/ /g<CR>:nohlsearch<CR>gv:Align =><CR>gv='lm-

"Make an undo point before deleting with ctrl-w in insert mode
inoremap <C-W> <C-G>u<C-W>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Make Y behave like C and D
nnoremap Y y$

" Make cw behave like dw and yw
onoremap w :execute 'normal! '.v:count1.'w'<CR>

set rtp+=/usr/local/opt/fzf
nnoremap <leader>u :MundoToggle<CR>
augroup mygroup
   autocmd!
   autocmd FileType scheme RainbowParentheses
   autocmd bufwritepost ~/.config/nvim/init.vim source $MYVIMRC
   autocmd bufwritepost ~/.config/nvim/init.vim AirlineRefresh
   autocmd BufRead,BufNewFile *.tpl set filetype=html
   autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt
   autocmd FileType php set commentstring=//\ %s
   autocmd BufWritePost *.php EnableFastPHPFolds
   autocmd BufWritePost *.php Neomake
   autocmd FileType php AlignCtrl g =>
   autocmd FileType md setlocal formatoptions+=t 
augroup END

" tslime {{{
nmap <leader>t <Plug>NormalModeSendToTmux
vmap <leader>t <Plug>SendSelectionToTmux
let g:tslime_ensure_trailing_newlines = 1
" }}}
colorscheme base16-solarized
" vim:ft=vim:foldmethod=marker
