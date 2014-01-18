" plugin manager
execute pathogen#infect()

" general config
let mapleader=","
let g:mapleader=","

set history=1000

filetype off
filetype plugin indent off
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

set background=dark

set nocompatible
set encoding=utf-8

set noshowcmd
set laststatus=2

" indentation
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start

" editor
set nowrap
set number
set ruler
set cursorline
set nostartofline
set hidden
set hid
set wildmenu
set wildmode=full
set textwidth=100
set magic
" set lbr
" set spell

" backup
set nobackup
set nowb
set noswapfile

" interval timeout
set notimeout
set ttimeout
set ttimeoutlen=100

set autoread
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set nobackup
set t_Co=256
set cmdheight=1
set noerrorbells
set novisualbell
set vb t_vb=
set tm=500

set ai
set si
set wrap

set shell=/usr/local/bin/zsh

colorscheme hemisu
let g:molokai_original = 1
let g:rehash256 = 1

if &term =~ '256color'
    set t_ut=
endif

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
inoremap <up> <NOP>

nnoremap <leader><space> :noh<cr>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

imap jj <ESC>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map Q gq

autocmd BufWritePre * :%s/\s\+$//e

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

map <leader>ct :!/usr/local/bin/ctags -R .<CR>

highlight ColorColumn ctermbg=magenta guibg=magenta
call matchadd('ColorColumn', '\%101v', 100)

" go formatter after save buffer
au FileType go au BufWritePre <buffer> Fmt

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" plugins

" resolve supertab snipmate conflict
let g:SuperTabDefaultCompletionType = "context"

" vim airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme = 'light'
let g:airline_powerline_fonts = 0
let g:airline_enable_branch = 1

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" nerdtree map
map <leader>n :NERDTreeToggle<CR>

" ctrlp
map <D-p> :CtrlP .<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.o,*.a,*.class,*~
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ }

" tagbar
map <leader>t :tag<space>
nnoremap <silent> <F8> :TagbarToggle<CR>

" nerdcommenter
map <D-/> <leader>c<space><CR>

" mini buffer explorer
map <leader>f :MBEFocus<CR>

" Dash
map <leader>d :Dash<CR>
map <leader>!d :Dash!<CR>

" You complete me
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
\}

" Indent line
let g:indentLine_color_term = 239
" let g:indentLine_char = '┆'
let g:indentLine_color_gui = '#CCCCCC'
let g:indentLine_fileTypeExclude = ['xml', 'txt', 'sh']

" delimitmate
let delimitMate_expand_cr = 1

" rainbow parenthese
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Auto Format
let g:formatprg_java = "astyle"
let g:formatprg_args_java = "--mode=java --style=google -fxjcpHxes4"
noremap <F3> :Autoformat<CR><CR>