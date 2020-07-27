" general config
let mapleader=","

set nocompatible               " Be iMproved

call plug#begin(expand('~/.vim/bundle'))

" My Bundles here:
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'gabesoft/vim-ags'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/matchit'
Plug 'luochen1990/rainbow'
Plug 'terryma/vim-multiple-cursors'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'ryanoasis/vim-devicons'
Plug 'jacoborus/tender.vim'
Plug 'sstallion/vim-wtf'
Plug 'rust-lang/rust.vim'
Plug 'easymotion/vim-easymotion'
Plug 'pbogut/fzf-mru.vim'
Plug 'liuchengxu/vista.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

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
set cursorline
set updatetime=300
set shortmess+=c
set signcolumn=yes
set mouse=a

" color & schema
if &term =~ '256color'
    set t_ut=
endif
set t_Co=256
set background=dark

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

set spelllang=en
set termguicolors
colorscheme wtf

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
set foldmethod=indent
set foldlevel=99

" split window navigation
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

" use ag search
nnoremap <D-f> :Ag<space>

" highlight if column exceeds the specified number
highlight ColorColumn ctermbg=magenta guibg=magenta
call matchadd('ColorColumn', '\%101v', 100)

if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

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

nnoremap <C-p> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>m :FZFMru<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS = '--layout=reverse'
let g:fzf_layout = { 'window': {
    \ 'width': 0.9,
    \ 'height': 0.7,
    \ 'highlight': 'Comment',
    \ 'rounded': v:false }}

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
let g:rainbow_active = 1

" smooth scroll
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 2.0
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp> :call comfortable_motion#flick(-40)<CR>

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

" vista
nnoremap <silent> <F8> :Vista!!<CR>
nnoremap <silent> <F9> :Vista finder<CR>
function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1

let g:lightline = {
    \ 'colorscheme': 'tender',
    \ 'active': {
    \  'left': [ [ 'mode', 'paste' ],
    \            [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \  'method': 'NearestMethodOrFunction'
    \ },
    \ 'separator': { 'left': '|', 'right': '|' },
    \ 'subseparator': { 'left': '|', 'right': '|' },
    \ }

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

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

let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

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

autocmd BufWritePre *.py execute ':Black'

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-refrences)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
"xmap <leader>f <Plug>(coc-format-selected)
"nmap <leader>f <Plug>(coc-format-selected)

" easy motion
map <leader> <Plug>(easymotion-prefix)
