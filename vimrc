""""
" settings
"""""
"make sure we are not compatible with vi
set nocompatible

source ~/.vim/basic-settings.vim

"initialize pathogen and all the bundles under .vim/bundle
filetype off 
call pathogen#infect()
call pathogen#helptags()

source ~/.vim/color-settings.vim

source ~/.vim/autocmd.vim

source ~/.vim/status-line.vim

source ~/.vim/key-mappings.vim

source ~/.vim/functions.vim

" from http://sunaku.github.io/vim-256color-bce.html
if &term =~ '^screen'
    " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
    execute "set t_kP=\e[5;*~"
    execute "set t_kN=\e[6;*~"
    " tmux will send xterm-style keys when its xterm-keys option is on
    " Arrow keys http://unix.stackexchange.com/a/34723
    execute "set <xUp>=\e[1;*A"
    execute "set <xRight>=\e[1;*C"
    execute "set <xDown>=\e[1;*B"
    execute "set <xLeft>=\e[1;*D"
endif
