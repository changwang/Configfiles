" plugin manager
call pathogen#infect()
call pathogen#helptags()

" general config
let mapleader=","
let g:mapleader=","

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

" color & schema
set background=light
colors hemisu
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
set list
set lcs=tab:▒░,trail:░,extends:»,precedes:«,eol:¬
set listchars=tab:▒░,trail:░,extends:»,precedes:«,eol:¬
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
nnoremap <CR> :nohlsearch<CR>
noremap <M-TAB> :bnext<CR>
noremap <M-S-TAB> :bprevious<CR>

map Q gq

" generate ctag file
map <leader>ct :!/usr/local/bin/ctags -R .<CR>

" use ag search
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif
nnoremap <D-f> :Ag<space>

" highlight if column exceeds the specified number
highlight ColorColumn ctermbg=magenta guibg=magenta
call matchadd('ColorColumn', '\%101v', 100)

" translate %% to file path
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" group of auto command
augroup vimrEx
    autocmd BufReadPost *
        \ if line("'\"") > 0 &&line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
augroup END

" plugins

" resolve supertab snipmate conflict
let g:SuperTabDefaultCompletionType = "context"

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = 's✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = 's⚠'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_java_checkers=['checkstyle']
let g:syntastic_java_checkstyle_classpath = "/checkstyle/checkstyle-5.7-all.jar"
let g:syntastic_java_checkstyle_conf_file = "/checkstyle/sun_checks.xml"

" vim airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme = 'light'
let g:airline_powerline_fonts = 1
let g:airline_enable_branch = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#color_template = 'visual'
let g:airline#extensions#ctrlp#color_template = 'replace'

" CtrlP
map <C-p> :<C-U>CtrlP<CR>
map <D-p> :<C-U>CtrlP<CR>
set suffixes+=.bak,.exe,.o,.obj,.swp,.ncb,.opt,.pdb,.class,.pyc
set wildignore+=*/tmp/*,*/target/*,*.so,*.swp,*.zip,*.pyc,*.o,*.a,*.class
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\~|\.git|\.hg|\.svn|\target)$',
    \ 'file': '\v\.(pyc|so|dll|class|exe)$',
    \ }

" tagbar
map <leader>t :tag<space>
nnoremap <silent> <F8> :TagbarToggle<CR>

" nerdcommenter
map <D-/> <leader>c<space><CR>

" Indent line
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
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
au Syntax * RainbowParenthesesLoadChevrons

" Auto Format
let g:formatprg_java = "astyle"
let g:formatprg_args_java = "--mode=java --style=google -fxjcpHxes4"
noremap <F3> :Autoformat<CR><CR>

" Goyo
nnoremap <silent> <leader>z :Goyo<cr>
let g:goyo_width = 120
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

" Mark
noremap <leader><leader>p <Plug>MarkSearchCurrentPrev

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

" UltiSnips
let g:UltiSnipsExpandTrigger = "<TAB>"
let g:UltiSnipsListSnippets = "<c-TAB>"
let g:UltiSnipsJumpForwardTrigger = "<TAB>"
let g:UltiSnipsJumpBackwardTrigger = "<s-TAB>"
