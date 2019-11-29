
" function! DoRemote(arg)
"   UpdateRemotePlugins
" endfunction

call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-vinegar'
Plug 'Chiel92/vim-autoformat'
Plug 'karptonite/vim-sleuth'
Plug 'simnalamburt/vim-mundo'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/Align'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'phpfolding.vim'
Plug 'karptonite/phpfolding.vim'
" Plug 'phpvim/phpfold.vim', { 'for': 'php', 'do':'composer update' }
Plug 'StanAngeloff/php.vim'
Plug 'chriskempson/base16-vim'
" Plug 'rking/ag.vim'
Plug 'chr4/nginx.vim'
" Plug 'mileszs/ack.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" Plug 'Shougo/denite.nvim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'Shougo/echodoc.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'frankier/neovim-colors-solarized-truecolor-only' | Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
" Plug 'mattn/gist-vim'
Plug 'kshenoy/vim-signature'
Plug 'rizzatti/funcoo.vim' | Plug 'rizzatti/dash.vim'
Plug 'SirVer/ultisnips'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire' | Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-line'
Plug 'benekastah/neomake' 
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'flazz/vim-colorschemes'
Plug 'jgdavey/tslime.vim'
Plug 'wellle/targets.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
" Plug 'danro/rename.vim'
 " Plug 'phpvim/phpcd.vim', { 'for': 'php' , 'do': 'composer install' }
Plug 'vim-scripts/progressbar-widget' " used for showing the index progress
Plug 'leafgarland/typescript-vim'
" needed for 'quramy/tsuquyomi'
" Plug 'Shougo/vimproc.vim'
" Plug 'quramy/tsuquyomi'

call plug#end()

" syntax enable
set termguicolors
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

let g:snips_author="Daniel Karp"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:markdown_fenced_languages = ['php', 'typescript']

" " handled by vim-sleuth now?
set tabstop=3
set softtabstop=3
set shiftwidth=3

set undofile

set tags=tags
set undodir=~/.nvim/undo
set backupdir=~/vimtmp
set dir=~/vimtmp
set number
set relativenumber
set nostartofline
" investigate breakindent
set breakindent
set incsearch
set hidden
set hlsearch 
set icm=nosplit
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

"Save and restore session {{{
fu! SaveSess()
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endif
syntax on
endfunction

autocmd VimLeave * call SaveSess()
" autocmd VimEnter * call RestoreSess()
"}}}

"Airline settings {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
"}}}
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:neomake_php_enabled_makers = ['php']
let g:neomake_typescript_enabled_makers = ['tslint']

let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1

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
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>

set wildmode=list:longest

"let g:LanguageClient_autoStart = 1
"let g:LanguageClient_serverCommands = {
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'typescript': ['/usr/local/bin/typescript-language-server', '--stdio'],
"    \ }


" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" tabularize both = an =>
nmap <leader>= :Tab /=>\@!<CR>
nmap <Leader>] :Tab /=><CR>
vmap <leader>= :Tab /=>\@!<CR>
vmap <Leader>] :Tab /=><CR>
nmap <silent> <leader>d <Plug>DashSearch
nmap <leader>v :edit $MYVIMRC<CR>

" changes 'foo' to 'foo' => self::FOO
nmap <leader>c yi'f'a => self::<ESC>"0pviwUA
nmap <leader>o 0f[i-><ESC>lds[ds'e

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" changes foo to 'foo' => $args['foo'],
nmap <leader>a 0wyiwysiw'A => $args['0'],F$

nnoremap <Leader>e :e <C-R>=expand('%:h') . '/'<CR>
vnoremap <Leader>j :!python -m json.tool<CR>

nnoremap <BS> <C-^>

"Align array
nmap <silent> <leader>l :delmarks l<CR>0mlvi[<..........gv:s/\s\+/ /g<CR>:nohlsearch<CR>gv:Align =><CR>gv='lm-

"Make an undo point before deleting with ctrl-w in insert mode
inoremap <C-W> <C-G>u<C-W>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif

" cnoreabbrev ag Ack!
" cnoreabbrev aG Ack!
" cnoreabbrev Ag Ack!
" cnoreabbrev AG Ack!
" let g:ackhighlight = 1
" let g:ackautoclose = 1

" Make Y behave like C and D
nnoremap Y y$

" Make cw behave like dw and yw
onoremap w :execute 'normal! '.v:count1.'w'<CR>

set rtp+=/usr/local/opt/fzf
nnoremap <leader>u :MundoToggle<CR>
augroup mygroup
   autocmd!
   " autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
   autocmd FileType scheme RainbowParentheses
   autocmd bufwritepost ~/dotfiles/nvim/init.vim source $MYVIMRC
   autocmd bufwritepost ~/dotfiles/nvim/init.vim AirlineRefresh
   " autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
   autocmd BufRead,BufNewFile *.tpl set filetype=html
   autocmd BufRead,BufNewFile location_rules.conf set filetype=nginx
   autocmd FileType lisp,scheme,art setlocal equalprg=scmindent.rkt
   autocmd FileType scheme let b:delimitMate_quotes="\""
   autocmd FileType php set commentstring=//\ %s
   autocmd BufWritePost *.php EnableFastPHPFolds
   autocmd BufWritePost *.php Neomake
   autocmd BufWritePost *.ts Neomake
   autocmd FileType php AlignCtrl g =>
   autocmd FileType md, markdown setlocal formatoptions+=t 
   "autocmd Filetype typescript nnoremap <buffer> <C-]> :call LanguageClient_textDocument_definition()<CR>
augroup END

" tslime {{{
nmap <leader>t <Plug>NormalModeSendToTmux
vmap <leader>t <Plug>SendSelectionToTmux
let g:tslime_ensure_trailing_newlines = 1
" }}}
colorscheme base16-monokai
let g:airline_theme='base16_monokai'
set background=dark
" vim:ft=vim:foldmethod=marker
