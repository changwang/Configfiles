" general config
let mapleader=","

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"NeoBundle 'kien/ctrlp.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'JazzCore/ctrlp-cmatcher'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'rking/ag.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'FelikZ/ctrlp-py-matcher'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'terryma/vim-smooth-scroll'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'junegunn/vim-pseudocl'
NeoBundle 'junegunn/vim-oblique'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'klen/python-mode'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

syntax on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set showcmd
set showmode
set laststatus=2
set scrolloff=5
set cmdheight=1
set tm=500
set history=1000
set si
set ttyfast

" color & schema
if &term =~ '256color'
    set t_ut=
endif
set t_Co=256
if has('gui_running')
    set background=light
else
    set background=dark
endif
colors ir_black

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
set nostartofline
set hidden
set wildmenu
set wildmode=full
set textwidth=100
set magic
set nolist
set lcs=tab:▒░,trail:░,extends:»,precedes:«,eol:¬
set listchars=tab:▒░,trail:░,extends:»,precedes:«,eol:¬
nmap <leader>l :set list!<CR>
set autowrite
set autoread
set wrap
set fileformats=unix,dos,mac

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

" folding
set foldenable
set foldnestmax=0
set foldmethod=syntax

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

nnoremap <leader>a gg<s-v>G

" generate ctag file
map <leader>ct :!/usr/local/bin/ctags -R .<CR>

" use ag search
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

" CtrlP
map <C-p> :<C-U>CtrlP<CR>
map <D-p> :<C-U>CtrlP<CR>
set suffixes+=.bak,.exe,.o,.obj,.swp,.ncb,.opt,.pdb,.class,.pyc,pyo
set wildignore+=*/tmp/*,*/target/*,*.so,*.swp,*.zip,*.pyc,*.o,*.a,*.class,*.pyo
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 1000
let g:ctrlp_extensions = ['funky']
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|target)$',
    \ 'file': '\v\*.(pyc|pyo|so|dll|class|exe)$',
    \ }
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden -g ""'
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

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = 's✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = 's⚠'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_java_checkers=['checkstyle']
let g:syntastic_java_checkstyle_classpath = "/checkstyle/checkstyle-6.1-all.jar"
let g:syntastic_java_checkstyle_conf_file = "/checkstyle/sun_checks.xml"

" resolve supertab snipmate conflict
let g:SuperTabDefaultCompletionType = "context"

" tagbar
map <leader>t :tag<space>
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

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

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" vim-go
let g:go_fmt_fail_silently = 1
let g:go_disable_autoinstall = 1

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

" smooth scroll
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 25, 3)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 17, 3)<CR>

" vim oblique
" let g:oblique#clear_highlight = 0

" nerd commenter
if has("gui_running")
    map <D-/> <Leader>c<Space>
else
    map <C-/> <Leader>c<Space>
endif

" Gundo
let g:gundo_width = 70
let g:gundo_preview_height = 30
let g:gundo_right = 1
let g:gundo_close_on_revert = 1
nnoremap <F5> :GundoToggle<CR>

" Goyo
nnoremap <leader>z :Goyo<CR>
let g:goyo_width = 100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
let g:goyo_linenr = 1

" NeoSnippet
imap <D-k> <Plug>(neosnippet_expand_or_jump)
smap <D-k> <Plug>(neosnippet_expand_or_jump)
xmap <D-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
