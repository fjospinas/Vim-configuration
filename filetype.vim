" Rexx, Rebol or R
au BufNewFile,BufRead *.r,*.R           call s:FTr()

func! s:FTr()
let max = line("$") > 50 ? 50 : line("$")

for n in range(1, max)
    " Rebol is easy to recognize, check for that first
    if getline(n) =~? '\<REBOL\>'
    setf rebol
    return
    endif
endfor

for n in range(1, max)
    " R has # comments
    if getline(n) =~ '^\s*#'
    setf r
    return
    endif
    " Rexx has /* comments */
    if getline(n) =~ '^\s*/\*'
    setf rexx
    return
    endif
endfor

" Nothing recognized, assume Rexx
setf rexx
endfunc
