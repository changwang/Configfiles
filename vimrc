" plugin manager
call pathogen#infect()
call pathogen#helptags()

" general config
let mapleader=","
let g:mapleader=","

set history=1000

filetype plugin indent on
syntax on

set background=light

set nocompatible
set encoding=utf-8

set showcmd
set showmode
set laststatus=2

" indentation
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
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
set title
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set list
set lcs=tab:▒░,trail:▓,extends:»,precedes:«,eol:¬
set listchars=tab:▒░,trail:▓,extends:»,precedes:«,eol:¬
nmap <leader>l :set list!<CR>

" backup
set nobackup
set nowb
set noswapfile

" interval timeout
set notimeout
set ttimeout
set ttimeoutlen=50

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

colors peaksea
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

:nnoremap <CR> :nohlsearch<CR>

map Q gq

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

map <leader>ct :!/usr/local/bin/ctags -R .<CR>

highlight ColorColumn ctermbg=magenta guibg=magenta
call matchadd('ColorColumn', '\%101v', 100)

cnoremap %% <C-R>=expand('%:h').'/'<CR>

augroup vimrEx
    autocmd BufReadPost *
        \ if line("'\"") > 0 &&line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

    autocmd BufWritePre * :%s/\s\+$//e
augroup END

" plugins

" resolve supertab snipmate conflict
let g:SuperTabDefaultCompletionType = "context"

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_java_checkers=['checkstyle']
let g:syntastic_java_checkstyle_classpath = "/Users/chang.wang/Libs/checkstyle/checkstyle-5.6-all.jar"
let g:syntastic_java_checkstyle_conf_file = "/Users/chang.wang/Libs/checkstyle/sun_checks.xml"

" vim airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"let g:airline_theme = 'bubblegum'
let g:airline_theme = 'light'
let g:airline_powerline_fonts = 0
let g:airline_enable_branch = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" nerdtree map
map <leader>n :NERDTreeTabsToggle<CR>
let g:NERDChristmasTree = 1
let NERDTreeIgnore=['^\.gradle$[[dir]]', '^classes$[[dir]]', '^target$[[dir]]', '^bin$[[dir]]', '^build$[[dir]]', '\.pyc$', '\~$']

" ctrlp
map <D-p>  :<C-U>CtrlP<CR>
set suffixes=.bak,.exe,.o,.obj,.swp,.ncb,.opt,.pdb,.class,.pyc
set wildignore+=*/tmp/*,*/target/*,*.so,*.swp,*.zip,*.pyc,*.o,*.a,*.class
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|\.hg|\.svn|target)$',
    \ 'file': '\v\.(pyc|so|dll|class|exe)$',
    \ }

" tagbar
map <leader>t :tag<space>
nnoremap <silent> <F8> :TagbarToggle<CR>

" nerdcommenter
map <D-/> <leader>c<space><CR>

" mini buffer explorer
map <leader>f :MBEFocus<CR>
let g:miniBufExplAutoStart = 10
noremap <M-TAB> :bnext<CR>
noremap <M-S-TAB> :bprevious<CR>

" Dash
map <leader>d :Dash<CR>
map <leader>!d :Dash!<CR>


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

" Goyo & vim-zenroom2
nnoremap <silent> <leader>z :Goyo<cr>
let g:goyo_width = 120
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

