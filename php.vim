"----------------------------------------
" settings
"----------------------------------------
set cin
set cindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4



"----------------------------------------
" abbreviation 
"----------------------------------------
ab { {!cursor!<cr>}<Esc>:call search('!cursor!','b')<cr>cf!



"----------------------------------------
" error msg 
"----------------------------------------
match errormsg /[\t]/
