" plugin manager
call pathogen#infect()
call pathogen#helptags()

" general config
let mapleader=","
let g:mapleader=","

filetype on
filetype plugin indent on
syntax on

" basic configuration
set nocompatible
set encoding=utf-8
set showcmd
set showmode
set laststatus=2
set scrolloff=5
set cmdheight=1
set tm=500
set history=1000
set si

set statusline=%f\ %m\ %r

" color & schema
set background=dark
colorscheme ir_black
if &term =~ '256color'
    set t_ut=
endif
set t_Co=256

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
set wildmenu
set wildmode=full
set textwidth=100
set magic
set nolist
set lcs=tab:▒░,trail:░,extends:»,precedes:«,eol:¬
set listchars=tab:▒░,trail:░,extends:»,precedes:«,eol:¬
set showbreak=↪
nmap <leader>l :set list!<CR>
set autowrite
set autoread
set wrap

" backup (I don't need them)
set nobackup
set nowb
set noswapfile

" interval timeout
set notimeout
set ttimeout
set ttimeoutlen=50

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" no need for visual feedback
set noerrorbells
set novisualbell
set vb t_vb=

" default shell
set shell=/usr/local/bin/zsh

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
inoremap <up> <NOP>

" help key acts as ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" jj acts as ESC
imap jj <ESC>

" split window navigation
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set splitbelow
set splitright

" customized keys
nnoremap <silent><CR> :nohlsearch<CR>
noremap <M-TAB> :bnext<CR>
noremap <M-S-TAB> :bprevious<CR>

nnoremap ww<CR> <ESC>:w<CR>
map <Leader>a ggVG

map Q gq

" folding
set foldenable
set foldmethod=indent
set foldlevelstart=1
set foldnestmax=2

" generate ctag file
map <leader>ct :!/usr/local/bin/ctags -R .<CR>

nnoremap <D-f> :Ag<space>

" highlight if column exceeds the specified number
highlight ColorColumn ctermbg=magenta guibg=magenta
call matchadd('ColorColumn', '\%101v', 100)

" translate %% to file path
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" group of auto command
augroup vimrEx
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \    exe "normal! g`\"" |
        \ endif
    autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

" plugins

set suffixes+=.bak,.exe,.o,.obj,.swp,.ncb,.opt,.pdb,.class,.pyc
set wildignore+=*/tmp/*,*/target/*,git,*.so,*.swp,*.zip,*.pyc,
set wildignore+=*.o,*.a,*.class,*.gem,.svn,*.gar.gz,*.tar.bz2
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](node_modules|target|dist)|(\.(git|hg|svn))$',
    \ 'file': '\v\.(exe|so|dll|pyc|pyo|o|a|class)$',
    \ }
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_max_files = 0
let g:ctrlp_lazy_update = 350
let g:ctrlp_clear_cache_on_exit = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

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
au Syntax * RainbowParenthesesLoadChevrons

" Vim session
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

let g:SuperTabDefaultCompletionType = "context"

"syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_quiet_warnings = 0
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = 's✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = 's⚠'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_java_checkers=['checkstyle']
let g:syntastic_java_checkstyle_classpath = "/Users/chang/Libs/checkstyle/checkstyle-5.7-all.jar"
let g:syntastic_java_checkstyle_conf_file = "/Users/chang/Libs/checkstyle/sun_checks.xml"

" Neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 20
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

" vim-go
let g:go_disable_autoinstall = 1
let g:go_fmt_fail_silently = 1

" vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_enable_branch = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" smooth scroll
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 25, 3)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 17, 3)<CR>
