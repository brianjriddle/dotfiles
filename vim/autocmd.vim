if has("autocmd")
    filetype plugin indent on
    " Load matchit (% to bounce from do to end, etc.)
    runtime! macros/matchit.vim
    augroup myfiletypes
        " Clear old autocmds in group
        autocmd!
        " autoindent with two spaces, always expand tabs
        autocmd FileType ruby,eruby,yaml,javascript set ai sw=2 sts=2 et
        autocmd FileType snippets set noexpandtab
        autocmd bufwritepost .vimrc source $MYVIMRC
        "set json to to javascript
        autocmd BufRead *.json set filetype=javascript
        "set to go
        autocmd BufRead *.go set filetype=go
        "Gemfile, Capfile are ruby files.
        autocmd BufRead Gemfile,Capfile set filetype=ruby
        autocmd BufNewFile,BufRead *.md,*.markdown setlocal spell spelllang=en_us
        autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
    augroup END
endif

