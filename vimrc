""""
" settings
"""""
"make sure we are not compatible with vi
set nocompatible

"knock off the training wheels
" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

set encoding=utf-8
" One of the most important options to activate. Allows you to switch from an
" " unsaved buffer without saving it first. Also allows you to keep an undo
" " history for multiple files. Vim will complain if you try to quit without
" " saving, and swap files will keep you safe if your computer crashes.
set hidden

"turn on the "ruler" (status info) at the bottom of the screen.
set ruler

"magic for completion at the : command line.
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.fasl,*.class

"Don't wrap text (makes windows ugly)
set nowrap

"Show matches for braces, parens, etc.
set showmatch

"do case-insensitive searching
set ignorecase

"When a search phrase has uppercase, don't be case insensitive
set smartcase

"Show me when I'm in insert/overtype mode
set showmode

"When a command is in progress, show it in the status bar 
set showcmd

"expand tabs to spaces
set expandtab

"Use industry standard 4-char tabs
set tabstop=4 

"Use standard 4-char indentation
set shiftwidth=4 

set softtabstop=4

"Indent/Dedent to nearest 4-char boundary
set shiftround 

"indent in a smart way, instead of returning to the left margin all the time
set autoindent 

"use incremental search"
set incsearch

"highlight searches
set hls

"always use unix line endings
set fileformat=unix
set fileformats=unix,dos

"set backspace to erase over everything
set bs=indent,eol,start

"set wrap
set wrap

"show what we are working on
set title

"keep 1000 items in history
set history=1000

"keepp more context when scrolling
set scrolloff=3

"keep prompts quiter
set shortmess=atI

"don't beep
set visualbell

" Enable use of the mouse for all modes
if has('mouse')
    set mouse=a
endif
 
"enable syntax highlight and other good stuff but not when using vimdiff
if &diff
    syntax off
else
    syntax enable
endif

"map a key for pasting text in the terminal as this is
"*my* default way of running vim :)
set pastetoggle=<F12>
 
"The commandbar is 2 high
set cmdheight=2

"do not clear screen on exit
"set t_ti= t_te=

set grepprg=ack-grep

set number

""""
" plugins
""""

"initialize pathogen and all the bundles under .vim/bundle
filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has("autocmd")
  filetype plugin indent on
  " Load matchit (% to bounce from do to end, etc.)
  runtime! macros/matchit.vim
  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
    autocmd FileType snippets set noexpandtab
    autocmd bufwritepost .vimrc source $MYVIMRC
  augroup END
endif

""""
" key mappings
""""

" Change <Leader>
let mapleader = ","

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

noremap <leader>ff :FufFile<CR>

"key mappings for fugitive
nmap <leader>gsr :Git svn rebase<CR>
nmap <leader>gsd :Git svn dcommit<CR>

"key mappings for NERDTREE
nmap <leader>nt :NERDTreeToggle<CR>

"map f6 to toggle search highlighting
map <F6> :set hls!<CR>

" map f7 to allow turning on and off of syntax on/off
map <F7> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<CR>

"map f8 to allow wrapping and unwrapping
map <F8> :set wrap!<CR>

"map <F9> to reformat entire file. this also saves the current cursor
"position so you are right back where you started. 
map <F9> :let save_cursor = getpos(".")<CR> gg=G <CR> :call setpos(".", save_cursor)<CR>:echo "Buffer reformatted"<CR>

"GPGOptions
let g:GPGPreferSymmetric=1

