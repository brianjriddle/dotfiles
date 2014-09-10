"set up colorscheme
set background=dark
set t_Co=256
if system('uname')=~'Linux'
    let g:solarized_termcolors=256
endif
colorscheme solarized
