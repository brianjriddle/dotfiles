""""
" key mappings
""""
"
"don't mistakenly ask for help
inoremap <f1> <esc>
nnoremap <f1> <esc>
cnoremap <f1> <esc>

" Use sane Regexes
nnoremap / /\v
vnoremap / /\v

" Change <leader>
let mapleader = ","

nmap <silent> <leader>s :set nolist!<CR>

"spped up buffer switching from https://github.com/nelstrom/dotfiles/
map <C-k> <C-W>k
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-l> <C-W>l

"toggle line numbers
map <leader>3 :set number!<CR>

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

"map 'Return' to toggle search highlighting
map <CR> :silent :nohlsearch<CR>

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

"make opening and closing taglist easier
noremap <leader>I :Tlist<CR>

"reformat json
noremap <leader>j :FormatJson<CR>
"reformat xml
noremap <leader>x :FormatXml<CR>
" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>rp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>rl :VimuxRunLastCommand<CR>

if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        nnoremap <leader>p :silent !open %<cr>:redraw!<cr>
    else
        nnoremap <leader>p :silent !xdg-open %<cr>:redraw!<cr>
    endif
endif

" Refort yaml. blah

map <leader>y :FormatYAML<CR>

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

