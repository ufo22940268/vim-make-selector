function! SetupMakeprg()
    let target = expand("<cword>")
    if (strlen(target) != 0)
        sil exec "set makeprg=make\\ ".target
    else
        echo "Please select a target"
    endif
endfunction

function! OpenMakeFileSelector()
    if (filereadable("Makefile")) 
        pyfile extract_targets.py
        map <buffer> <cr> :call SetupMakeprg()<CR>
    else
        echoerr "Makefile not exists"
    endif
endf

noremap <leader>fm call OpenMakeFileSelector()
