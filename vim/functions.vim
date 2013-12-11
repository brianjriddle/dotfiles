"""""
" functions
""""

" ReformatJson requires jsonpp which
" which is provided by https://github.com/jmhodges/jsonpp
" use brew or follow the instructions to compile it your self
" brew install jsonpp


function! ReformatJson()
    if executable('jsonpp')
        silent %!jsonpp
    else
        echoerr "jsonpp not found in path"
    endif
endfunction
command! FormatJson call ReformatJson()

" ReformatXml requires xmllint provided by libxml

function! ReformatXml()
    if executable('xmllint')
        silent %!xmllint --format -
    else 
        echoerr "xmllint not found in path"
    end
endfunction
command! FormatXml call ReformatXml()

" ReformatYAML requires ~/bin/yaml-pp

function! ReformatYAML()
    if executable('yaml-pp')
        silent %!yaml-pp %
    else 
        echoerr "yaml-pp not found in path"
    end
endfunction
command! FormatYAML call ReformatYAML()

