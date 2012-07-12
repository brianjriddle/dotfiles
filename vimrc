""""
" settings
"""""
"make sure we are not compatible with vi
set nocompatible

"ok this just makes everybody freak :) turning off 
"makes paring easier.
"knock off the training wheels
" disable arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

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

"keep more context when scrolling
"set scrolloff=3
set scrolloff=999

"keep prompts quiter
set shortmess=atI

"don't beep
set visualbell
set t_vb=

"Link unnamed register and OS clipboard:
set clipboard=unnamed

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


set number

"fix for zshrc not getting source when using rvm.
"see http://gabebw.wordpress.com/2010/08/02/rails-vim-rvm-and-a-curious-infuriating-bug/
set shell=sh

""""
" plugins
""""

"initialize pathogen and all the bundles under .vim/bundle
filetype off 
call pathogen#infect()
call pathogen#helptags()

"set up colorscheme
if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme solarized

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
    "set json to to javascript
    autocmd BufRead *.json set filetype=javascript
    "Rakefile, Capfile are ruby files.
    autocmd BufRead Capfile set filetype=ruby
    autocmd BufNewFile,BufRead *.md,*.markdown setlocal spell spelllang=en_us
    autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
  augroup END
endif

"blantanly plagarized from https://github.com/scrooloose/vimfiles/blob/master/vimrc

"statusline setup
set statusline=%F "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h "help file flag
set statusline+=%y "filetype
set statusline+=%r "read only flag
set statusline+=%m "modified flag

set statusline+=%{fugitive#statusline()}

set statusline+=%= "left/right separator
set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$


"enable ack.vim
let g:ackprg="ack -H --nocolor --nogroup --column"

""""
" key mappings
""""

" Change <leader>
let mapleader = ","

nmap <silent> <leader>s :set nolist!<CR>

"spped up buffer switching from https://github.com/nelstrom/dotfiles/
map <C-k> <C-W>k
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-l> <C-W>l

"Run rake from rails.vim
nmap <leader>r :Rake<cr>

"another nelstrom tip using tim-pope's unimpaired
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"key mappings for fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gsr :Git svn rebase<CR>
nmap <leader>gsd :Git svn dcommit<CR>

"make moving to next spelling mistake easier
nmap <leader>z ]s

"key mappings for NERDTREE
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>N :NERDTreeFind<CR>

"map f6 to toggle search highlighting
map <F6> :silent :nohlsearch<CR>

" map f7 to allow turning on and off of syntax on/off
map <F7> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<CR>

"map f8 to allow wrapping and unwrapping
map <F8> :set wrap!<CR>

"map <F9> to reformat entire file. this also saves the current cursor
"position so you are right back where you started. 
map <F9> :let save_cursor = getpos(".")<CR> gg=G <CR> :call setpos(".", save_cursor)<CR>:echo "Buffer reformatted"<CR>

"solarize toggle
call togglebg#map("<F5>")

"keymappings for Tabular
if !has('&g:tabular_loaded')
  noremap  <leader>a= :Tabularize /=<CR>
  vnoremap <leader>a= :Tabularize /=<CR>
  noremap  <leader>a: :Tabularize /:\zs<CR>
  noremap  <leader>A: :let save_cursor = getpos(".")<CR> :%Tabularize /:\zs<CR> :call setpos(".", save_cursor)<CR> :echo "Buffer realigned" <CR>
  vnoremap <leader>a: :Tabularize /:\zs<CR>
  noremap  <leader>a> :Tabularize /=><CR>
  vnoremap <leader>a> :Tabularize /=><CR>
endif

" Backspace in Visual mode deletes selection.
"
vnoremap <BS> d
" Tab/Shift+Tab indent/unindent the highlighted
" block (and maintain the highlight after changing
" the indentation). Works for both Visual and
" Select modes.
"
vnoremap <Tab>    >gv
vnoremap <S-Tab>  <gv
"remap control-] so we can get jump to files using ctags.
noremap <leader>i <C-]>
