" 
" Douglas Daly
" 
" General {{{

set hidden

set nobackup
set nowritebackup

set autoread
set nocompatible

set noerrorbells
set novisualbell

set encoding=UTF-8

" }}}
" Colors {{{

syntax enable
filetype indent on
filetype plugin on

if (has("termguicolors"))
    set termguicolors
endif
" }}}
" Spaces & Tabs {{{{{{

set backspace=indent,eol,start

set autoindent
set shiftwidth=4

set smarttab
set expandtab		        " Use spaces for tabs
set tabstop=4               " 4 spaces per tab
set softtabstop=4	        " 4 space tab

" }}}}}}
" Folding {{{

set modelines=1
set foldenable              " Enable code folding
set foldnestmax=10          " 10 nested folds max
set foldmethod=indent       " Fold based on indent level
set foldlevel=10            " Default fold level

" space open/closes folds
nnoremap <space> za

" }}}
" General UI {{{

set number
set relativenumber

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

set ruler
set cursorline              " Current line highlight
set colorcolumn=73,80
set hid                     " Hide abandoned buffers

set lazyredraw              " Only redraw when needed
set showmatch               " Highlight matching brackets
set wildmenu                " Visual autocomplete for command menu
set laststatus=2

:set so=999                 " Center cursor in window

set splitbelow
set splitright


" }}}
" Searching {{{

set incsearch               " Search as characters are entered
set hlsearch                " Highlight matches
set smartcase

" turn off search highlight shortcut
nnoremap // :nohlsearch<CR>
vnoremap // y/<C-R>"<CR>

" }}}
" Movement {{{

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Move between splits with Shift
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}
" Keyboard Shortcuts {{{

let mapleader=","           " Leader is a comma

" shortcut to edit this file
noremap <leader>vim :edit ~/.config/nvim/init.vim<CR>

" easily add/remove blank lines from file
nnoremap <silent> <leader>k :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <leader>j :set paste<CR>m`O<Esc>``:set nopaste<CR>

" move between buffers
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <C-x> :b#<bar>bd#<CR>

" create window splits more easily
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" }}}
" Plugins {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Helpers
" {{{ VIM Window Swap
Plug 'wesQ3/vim-windowswap'

let g:windowswap_map_keys = 0
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>sw :call WindowSwap#EasyWindowSwap()<CR>
" }}}
" {{{ Easy Escape
Plug 'zhou13/vim-easyescape'

let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 200
cnoremap jk <ESC>
cnoremap kj <ESC>
" }}}
" {{{ Easy Clip
Plug 'svermeulen/vim-easyclip'

nnoremap gm m
" }}}
" {{{ Abolish
Plug 'tpope/vim-abolish'
" }}}
" {{{ Dispatch
Plug 'tpope/vim-dispatch'
" }}}
" {{{ Eunuch
Plug 'tpope/vim-eunuch'
" }}}
" {{{ Repeat
Plug 'tpope/vim-repeat'
" }}}
" {{{ Search (FZF)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

nnoremap <silent> <leader>f :Files<CR>
" }}}
" {{{ Gundo
Plug 'simnalamburt/vim-mundo'

nnoremap <leader>u :MundoToggle<CR>
set undofile
set undodir=~/.local/share/nvim/undo
" }}}

" Git
" {{{ Fugitive (Git)
Plug 'tpope/vim-fugitive'
" }}}
" {{{ Git Gutter
Plug 'airblade/vim-gitgutter'
" }}}

" UI
" {{{ VS Code Dark theme
Plug 'tomasiser/vim-code-dark'
" }}}
" {{{ Buffer Gator
Plug 'jeetsukumaran/vim-buffergator'

map <C-b> :BuffergatorToggle<CR>
" }}}
" {{{ Tag Bar
Plug 'majutsushi/tagbar'

nnoremap <C-m> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
unmap <CR>
" }}}
" {{{ Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='term'
let g:airline#extensions#tabline#enabled = 1
" }}}
" {{{ NERD Tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1

autocmd FileType nerdtree setlocal nolist
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTreeToggle' argv()[0] | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif

" file extension highlighting for NERDTree
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    let color_str = ''
    if a:fg != 'none'
        let color_str = color_str .' ctermfg=' . a:fg
    endif
    if a:bg != 'none'
        let color_str = color_str .' ctermbg=' . a:bg
    endif
    if a:guifg != 'none'
        let color_str = color_str .' guifg=' . a:guifg
    endif
    if a:guibg != 'none'
        let color_str = color_str .' guibg=' . a:guibg
    endif
    
    exec 'autocmd filetype nerdtree highlight ' . a:extension . color_str
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" file highlighting
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', 'none')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
" }}}
" {{{ Indent Line
Plug 'Yggdroot/indentLine'

let g:indentLine_setConceal = 0
" }}}

" Snippets
" {{{ Ultisnips
" Plug 'SirVer/ultisnips'

" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsListSnippets = "<c-tab>"
" let g:UltiSnipsEditSplit = "vertical"

" let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/my-snippets/UltiSnips', 'UltiSnips']

" let g:ultisnips_python_style = "numpy"
" }}}
" {{{ Snippets
Plug 'honza/vim-snippets'
" }}}

" Dev tools
" {{{ CoC (Autocomplete)
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

"set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <CR> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" goto keys
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show doc in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" remap for rename symbol under cursor
nmap <leader>rn <Plug>(coc-rename)

" add status line support
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" use <tab> for select selections ranges
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" }}}
" {{{ Tests
Plug 'janko/vim-test'

let test#strategy = "vimterminal"
" }}}
" {{{ Commentary
Plug 'tpope/vim-commentary'
" }}}
" {{{ Surround
Plug 'tpope/vim-surround'
" }}}
" {{{ Polyglot
Plug 'sheerun/vim-polyglot'

let g:python_highlight_all = 1
" }}}

" Python
" {{{ IPython
Plug 'bfredl/nvim-ipy'

function! ConnectToPipenvKernel()
    let a:kernel = GetKernelFromPipenv()
    call IPyConnect('--kernel', a:kernel, '--no-window')
endfunction

function! AddFilepathToSyspath()
    let a:filepath = expand('%:p:h')
    call IPyRun('import sys; sys.path.append("' . a:filepath . '")')
    echo 'Added ' . a:filepath . ' to python sys.path'
endfunction

command! -nargs=0 ConnectToPipenvKernel call ConnectToPipenvKernel()
command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --existing")
command! -nargs=0 AddFilepathToSyspath call AddFilepathToSyspath()
" }}}

" Misc. files
" {{{ Editor Config
Plug 'editorconfig/editorconfig-vim'
" }}}
" {{{ To Do Text
Plug 'freitass/todo.txt-vim'
" }}}
" {{{ Markdown
Plug 'plasticboy/vim-markdown'

let g:vim_markdown_conceal = 0
" }}}

" Web
" {{{ Emmet
Plug 'mattn/emmet-vim'
" }}}
" {{{ Javascript
Plug 'pangloss/vim-javascript'
" }}}

" (Needs to be called last)
" {{{ Dev Icons
Plug 'ryanoasis/vim-devicons'

let g:DevIconsEnableNERDTreeRedraw = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" }}}
" {{{ Super Tab
"Plug 'ervandew/supertab'
"
"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:SuperTabContextDefaultCompletionType = "<c-n>"
" }}}

call plug#end()

" }}}
" Misc Settings {{{

colorscheme codedark

" }}}
" Custom Functions {{{

" get pipenv kernel
function! GetKernelFromPipenv()
    let a:kernel = tolower(system('basename $(pipenv --venv)'))
    return substitute(a:kernel, '[[:cntrl:]]', '', 'g')
endfunction

" hide extra stuff
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        exe 'AirlineToggle'
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        exe 'AirlineToggle'
    endif
endfunction

nnoremap <leader>h :call ToggleHiddenAll()<CR>

" }}}
" {{{ Neovim 

" python3
let g:python3_host_prog = '~/.pyenv/versions/neovim-venv/bin/python'

" }}}
" vim:set foldmethod=marker foldlevel=0:
