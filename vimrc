"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"curl -LO https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark && eval dircolors dircolors.256dark
set nocompatible
filetype off

""""""""""" Plugins """""""""""""
call plug#begin('$VIM/plugged')

"git interface
Plug 'tpope/vim-fugitive'

"filesystem
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 'w'

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'

"Colors!!!
Plug 'altercation/vim-colors-solarized'
call plug#end()

filetype plugin indent on    " enables filetype detection

"custom keys
let mapleader = "\<Space>"
map <Leader>y "+y
map <Leader>d "+d
map <Leader>p "+p
map <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nnoremap <Leader>v V
"nmap <Leader><Leader> V
" map <Leader>b :make<CR>
nnoremap <c-a><c-a> <C-^> "switch buffer
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>i :CtrlPBuffer<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>g gf
nmap <LEADER>c :silent noh<CR>
nnoremap <LEADER>c :silent noh<CR>
cnoremap <C-k> <up>
cnoremap <C-j> <down>
inoremap <c-l> <Right>
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <Tab> :bn<cr>
nnoremap <s-Tab> :bp<cr>
map <leader>t :NERDTreeToggle<CR>

set nobackup
set nowritebackup
set noswapfile
set hlsearch                    " hilight searches, map below to clear
nohlsearch
set incsearch                   " do incremental searching
set ignorecase                  " Case insensitive...
set smartcase

colorscheme solarized
set background=dark

if has('gui_running')
    set guioptions-=r "Hide the right side scrollbar
    set guioptions-=L "Hide the left side scrollbar
    set guioptions-=T "Hide toolbars...this is vim for craps sake
    set guioptions-=m "Hide the menu, see above
    set go-=m go-=T go-=l go-=L go-=r go-=R go-=b go-=F

    " Size and position the window well (only perform on startup)
    if !exists('g:vimrc_loaded')
        set columns=999
        set lines=999
        "winpos 999 5
    endif

    " Hightlight the current row. Index-guide plugin covers columns
    set cursorline

    " MacVim is very pretty
    if has('gui_macvim')
        " set transparency=8

        " Fullscreen options
        set fuoptions=maxvert
        " au GUIEnter * set fullscreen
    endif

" Set a pretty font
    if has('win32')
        " set guifont=Consolas:h11:b
        set guifont=Inconsolata:h11:b
        map <F11> <Esc>:call libcallnr($VIM."\\gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    elseif has('mac')
        if !exists('g:vimrc_loaded')
          set guifont=Menlo:h18
        endif
    endif
else
    "set nocursorline nocursorcolumn
endif

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" let g:NERDTreeQuitOnOpen = 1
let g:nerdtree_tabs_open_on_gui_startup=0

"turn on numbering
set nu

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h,*.sh set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
