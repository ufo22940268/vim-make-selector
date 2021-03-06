function! SetupMakeprg()
    let target = expand("<cword>")
    if (strlen(target) != 0)
        sil exec "set makeprg=make\\ ".target
        bd!
    else
        echo "Please select a target"
    endif
endfunction

function! OpenMakeFileSelector()
    if (filereadable("Makefile")) 
        pyfile ~/.vim/bundle/vim-make-selector/extract_targets.py
        map <buffer> <cr> :call SetupMakeprg()<CR>
    else
        echoerr "Makefile not exists"
    endif
endf

noremap <leader>fm :call OpenMakeFileSelector()<cr>
