"----------------------------------------
" pathogen
"----------------------------------------
call pathogen#infect()
filetype plugin indent on




"----------------------------------------
" sessions
"----------------------------------------
silent! source $HOME/.vim/%:e.vim




"----------------------------------------
" settings
"----------------------------------------
syntax on

set autoindent
set backspace=indent,eol,start
set csto=1
set encoding=utf-8
"set expandtab
set fileencodings=utf-8,gbk
set hlsearch
set nocompatible
set nocsverb
set number
set ruler
"set shiftwidth=4
set showtabline=0
"set softtabstop=4
"set tabstop=4
set tags=tags;
set textwidth=120
set wrap




"----------------------------------------
" syntax
"----------------------------------------
let g:c_syntax_for_h = 1




"----------------------------------------
" exceptions settings
"----------------------------------------
" tablength exceptions
" autocmd FileType html setlocal shiftwidth=2 tabstop=2
" autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
" autocmd FileType javascript setlocal shiftwidth=2 tabstop=2




"----------------------------------------
" functions
"----------------------------------------

" Showtabline
let g:showtabline = 0
function Showtabline()
    if g:showtabline == 0
        :set showtabline=1
        let g:showtabline = 1
    else
        :set showtabline=0
        let g:showtabline = 0
    endif
endfunction

" match error
let g:match_error = 0
function MatchError()
    if g:match_error == 0
        :match errormsg /[\t]\| \+$/
        let g:match_error = 1
    else
        :match NONE
        let g:match_error = 0
    endif
endfunction

" cscope
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        exe "cs add " . db . " " . path
    endif
endfunction


" license
function InsertLicense()
    let filename = expand('%:t')
    let dot = strridx( filename, "." )
    let suffix = strpart( filename, dot )
    let license_file = printf( "%s%s", "~/.vim/license", suffix )
    exe "read" license_file
endfunction




"----------------------------------------
" auto commands 
"----------------------------------------

" Remember the last position of the cursor.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" au FilterWritePre * if &diff | windo set wrap | endif

" csope
au BufEnter /* call LoadCscope()

" tagbar
autocmd Filetype mmix,cweb,scheme,asm,h,c,hpp,cpp,cc,CC,zsh,sh,python,ruby,php,make,vim,lex,text,cmake :TagbarToggle



"----------------------------------------
" map 
"----------------------------------------

" F2 save file
map <F2> :w<cr>
imap <F2> <esc>:w<cr>
cmap <F2> <esc>:w<cr>


" F3 save all file and quit
map <F3> :xa<cr>
imap <F3> <esc>:xa<cr>
cmap <F3> <esc>:xa<cr>


" F4 quit all
map <F4> :qa<cr>
imap <F4> <esc>:qa<cr>
cmap <F4> <esc>:qa<cr>


" F5 tagbar 
map <F5> :TagbarToggle<cr>
imap <F5> <esc>:TagbarToggle<cr>i
cmap <F5> <esc>:TagbarToggle<cr>


" F6 nerdtree
map <F6> :NERDTreeToggle<cr>
imap <F6> <esc>:NERDTreeToggle<cr>i
cmap <F6> <esc>:NERDTreeToggle<cr>


" F7 showtabline
map <F7> :call Showtabline()<cr>
imap <F7> <esc>:call Showtabline()<cr>i
cmap <F7> <esc>:call Showtabline()<cr>


" F8 c++ comment line
map <F8> i//-------------------------------------------------------------------------------------------------------------------//
imap <F8> //-------------------------------------------------------------------------------------------------------------------//
cmap <F8> //-------------------------------------------------------------------------------------------------------------------//<esc>

" F9 license
map <F9> :call InsertLicense()<cr>
imap <F9> <esc>:call InsertLicense()<cr>
cmap <F9> <esc>:call InsertLicense()<cr>

" F12 match error
"map <F12> :call MatchError()<cr>
"imap <F12> <esc>:call MatchError()<cr>
"cmap <F12> <esc>:call MatchError()<cr>
map <F12> :!grep -n "\(	\)\\|\( \+$\)" %<cr>



" cscope
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>




"----------------------------------------
" tagbar 
"----------------------------------------
let tagbar_left=1
let tagbar_width=34
let tagbar_sort=0
let tagbar_compact=1




"----------------------------------------
" nerdtree 
"----------------------------------------
let NERDTreeShowHidden=1
let NERDTreeWinPos="right"
let NERDTreeWinSize=30
let NERDTreeMinimalUI=1




"----------------------------------------
" clang_complete 
"----------------------------------------
let g:clang_auto_select=1 
let g:clang_hl_errors=1
let g:clang_close_preview=1
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_snippets_engine='clang_complete'
let g:clang_use_library=1
let g:clang_library_path='/usr/local/lib'
let g:clang_user_options='-stdlib=libc++ -std=c++11'
let g:clang_complete_macros=1 

let g:clic_filename="./index.db"

nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>
nnoremap <Leader>r :call ClangGetReferences()<CR>
nnoremap <Leader>d :call ClangGetDeclarations()<CR>
nnoremap <Leader>s :call ClangGetSubclasses()<CR>
