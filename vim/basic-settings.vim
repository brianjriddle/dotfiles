set ttyfast

set encoding=utf-8

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

"turn on the 'ruler' (status info) at the bottom of the screen.
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

"keep more context when scrolling
set scrolloff=999

"keep prompts quiter
set shortmess=atI

"don't beep
set visualbell
set t_vb=

"Link unnamed register and OS clipboard:
if $TMUX == ''
    set clipboard+=unnamed
endif

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
set paste
set pastetoggle=<F12>

"The commandbar is 2 high
set cmdheight=2

"fix for zshrc not getting source when using rvm.
"see http://gabebw.wordpress.com/2010/08/02/rails-vim-rvm-and-a-curious-infuriating-bug/
set shell=sh

"More natural splitting from
"http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally
"
set splitbelow
set splitright

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
