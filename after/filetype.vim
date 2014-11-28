" MMIX or VMS makefile
au BufNewFile,BufRead *.mms,*.mmt call s:FTmms()

func! s:FTmms()
  let n = 1
  while n < 10
    let line = getline(n)
    if line =~ '^\s*\(%\|//\)' || line =~ '^\*'
      setf mmix
      return
    endif
    if line =~ '^\s*#'
      setf make
      return
    endif
    let n = n + 1
  endwhile
  setf mmix
endfunc
