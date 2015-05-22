" reference https://github.com/sheerun/dotfiles
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

let autoldir = $HOME.'/.vim/autoload'
if has('unix') && !isdirectory(g:autoldir)
  :silent execute '!git clone --depth=1 https://github.com/junegunn/vim-plug.git'.' '.g:autoldir
end

""""""""""" Plugins """""""""""""

let plugdir = $VIM.'/plugged'
if has('unix')
  let plugdir = $HOME.'/.vim/plugged'
end
call plug#begin(g:plugdir)
Plug 'ashokez/vimrc'
Plug 'vim-scripts/bclear'
Plug 'altercation/vim-colors-solarized'

Plug 'sheerun/vim-polyglot'

Plug 'kien/ctrlp.vim'

" Press v over and over again to expand selection
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Lightning fast :Ag searcher
Plug 'rking/ag.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'

" Allow to :Rename files
Plug 'danro/rename.vim'

" Automatically find root project directory
Plug 'airblade/vim-rooter'

" Expand / wrap hashes etc.
Plug 'AndrewRadev/splitjoin.vim'
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>


"Plug 'Blackrush/vim-gocode', { 'for': 'go' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'moll/vim-node', { 'for': 'node' }


" Nice column aligning with <Enter>
Plug 'junegunn/vim-easy-align'
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

Plug 'michaeljsmith/vim-indent-object' " ii / ai

" For more reliable indenting and performance
set foldmethod=manual
set fillchars="fold: "

" Nice file browsing with -
Plug 'eiginn/netrw'
let g:netrw_altfile = 1
Plug 'tpope/vim-vinegar'

" Better search tools
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/gitignore'

Plug 'Shougo/vimproc.vim'
Plug 'Quramy/tsuquyomi'

"-----------------------------------------------------------
" YouCompleteMe - Intelligent completion with fuzzy matching
"-----------------------------------------------------------

Plug 'Valloric/YouCompleteMe'

let g:ycm_dont_warn_on_startup = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

let g:ycm_filetype_blacklist = {}

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

"--------------------------------------------------
" Supertab - enhanced tab behavior based on context
"--------------------------------------------------

Plug 'ervandew/supertab'

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

"----------------------------------------
" UltiSnips - Fancy snippet functionality
"----------------------------------------

Plug 'SirVer/ultisnips'

let g:UltiSnipsSnippetsDir='~/.vim/snippets'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

nnoremap <leader>ue :UltiSnipsEdit<cr>
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configurations
"------------------------
set t_Co=256
set vb
set nocompatible                " Don't maintain compat with Vi.
set hidden                      " Allow buffer change w/o saving
set autoread                    " Load file from disk, ie for git reset
set lazyredraw                  " Don't update while executing macros
set backspace=indent,eol,start	" Sane backspace behavior
set history=1000  		          " Remember last 1000 commands
set scrolloff=4                 " Keep at least 4 lines below cursor
set expandtab                   " Convert <tab> to spaces (2 or 4)
set tabstop=2                   " Two spaces per tab as default
set shiftwidth=2                "     then override with per filteype
set softtabstop=2               "     specific settings via autocmd
set secure                      " Limit what modelines and autocmds can do
set ai "autoindent
set si "smartindent
set relativenumber
" set ruler       " show the cursor position all the time
set cursorline
set showcmd     " display incomplete commands
set showmatch
set noerrorbells
set nocursorcolumn
syntax sync minlines=256
set synmaxcol=128
set re=1
set noshowmatch                   " Do not show matching brackets by flickering
set ttyfast
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set nobackup
set nowritebackup
set noswapfile
set hlsearch                    " hilight searches, map below to clear
nohlsearch                      " kill highliting on vimrc reload
set incsearch                   " do incremental searching
set ignorecase                  " Case insensitive...
set smartcase                   " ...except if you use UCase
set notimeout
set ttimeout
set ttimeoutlen=10

"colorscheme bclear
"colorscheme solarized
"set background=dark

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
        set guifont=Consolas:h10:b
        map <F11> <Esc>:call libcallnr($VIMRUNTIME."\\gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    elseif has('mac')
        if !exists('g:vimrc_loaded')
          set guifont=Menlo:h18
        endif
    endif
endif

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V
nmap <Leader>b :make<CR>
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>i :CtrlPBuffer<CR>
nnoremap <CR> G
nnoremap <BS> gg
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>v V
nnoremap <Leader>g gf

" Remove trailing whitespaces
nnoremap <silent> <Leader><BS> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>

nnoremap H 0
nnoremap L $

" Enable Spell Checking for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell

nmap <LEADER>c :silent noh<CR>
nnoremap <LEADER>c :silent noh<CR>

cnoremap <C-k> <up>
cnoremap <C-j> <down>

inoremap <c-l> <Right>
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <Tab> :bn<cr>
nnoremap <s-Tab> :bp<cr>

nnoremap <c-Tab> gt<cr>
nnoremap <c-s-Tab> gT<cr>

inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-x><c-n>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-x><c-k>"))

" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" Really nice prompt
set laststatus=2 " Always show the statusline
"define 3 custom highlight groups
hi User1 ctermbg=lightgray ctermfg=yellow guifg=orange guibg=#444444 cterm=bold gui=bold
hi User2 ctermbg=lightgray ctermfg=red guifg=#dc143c guibg=#444444 gui=none
hi User3 ctermbg=lightgray ctermfg=red guifg=#ffff00 guibg=#444444 gui=bold
set statusline= " Clear the statusline for vimrc reloads
set stl=%*                       " Normal statusline highlight
set stl+=%{InsertSpace()}        " Put a leading space in
set stl+=%1* 				     " Red highlight
set stl+=%{HasPaste()}           " Red show paste
set stl+=%*                      " Return to normal stl hilight
set stl+=%t                      " Filename
set stl+=%2* 				     " Red highlight
set stl+=%m                      " Modified flag
set stl+=%*                      " Return to normal stl hilight
set stl+=%r                      " Readonly flag
set stl+=%h                      " Help file flag
set stl+=%*                      " Set to 3rd highlight
set stl+=\ %y                    " Filetype
set statusline+=%{SlSpace()}     " Vim-space plugin current setting
set stl+=\ \ Line:%l/%L          " Line # / total lines
set stl+=\ \ Col:%c              " Column number
set stl+=\ \ %P%{InsertSpace()}  " Single space buffer
set stl+=%*                      " Return to normal stl hilight

function! SlSpace()
    if exists("*GetSpaceMovement")
        return "[" . GetSpaceMovement() . "]"
    else
        return ""
    endif
endfunc

function! InsertSpace()
    " For adding trailing spaces onto statusline
    return ' '
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction


