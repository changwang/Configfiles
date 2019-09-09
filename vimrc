" general config
let mapleader=","

set nocompatible               " Be iMproved

call plug#begin(expand('~/.vim/bundle'))

" My Bundles here:
Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/matchit'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'mac' : 'make',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
Plug 'sjl/gundo.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mattn/emmet-vim'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'

" Required:
call plug#end()

" Required:
filetype plugin indent on

syntax on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set showcmd
set showmode
set showmatch
set laststatus=2
set scrolloff=5
set cmdheight=1
set tm=500
set history=500
set si
set ttyfast
set guicursor=
set guioptions-=e
set guifont=FuraCode\ Nerd\ Font\ Mono:h14

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
colors PaperColor

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
set lazyredraw
set textwidth=100
set magic
set nolist
set lcs=tab:▒░,trail:░,extends:»,precedes:«,eol:¬
nmap <leader>l :set list!<CR>
set autowrite
set autoread
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

set lbr
set tw=500

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
imap jk <ESC>

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

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%' }

let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'

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

" tagbar
map <leader>t :tag<space>
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" vim-go
let g:go_fmt_fail_silently = 1
let g:go_disable_autoinstall = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1

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
let g:goyo_width = 120
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
let g:goyo_linenr = 1

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \  'left': [ [ 'mode', 'paste' ],
    \            [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \  ]
    \ },
    \ 'separator': { 'left': '|', 'right': '|' },
    \ 'subseparator': { 'left': '|', 'right': '|' }
    \ }

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
"let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
"let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

function! WebIconType()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! WebIconFormat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\~$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:easytags_async = 1

nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

let g:codi#width = 100
let g:codi#rightalign = 0

let macvim_skip_colorscheme=1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:lightline = {
    \ 'colorscheme': 'PaperColor',
    \ }
