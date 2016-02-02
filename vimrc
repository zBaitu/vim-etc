"---------------------------------------
" pathogen
"---------------------------------------
call pathogen#infect()
filetype plugin indent on




"---------------------------------------
" settings
"---------------------------------------
syntax on

set background=dark
set autoindent
set backspace=indent,eol,start
set csto=1
set encoding=utf-8
set fileencodings=utf-8,gbk
set foldmethod=marker
set foldlevel=0
set hlsearch
set nocompatible
set nocsverb
set nofoldenable
set number
set ruler
set shiftwidth=4
set showtabline=0
set softtabstop=4
set t_Co=256
"do not clear vim screen when quit
set t_te=
set t_ti=
set tabstop=4
set tags=tags;
set textwidth=120
set wrap




"---------------------------------------
" syntax
"---------------------------------------
let g:c_syntax_for_h = 1




"----------------------------------------
" exceptions settings
"----------------------------------------
" tablength exceptions
" autocmd FileType html setlocal shiftwidth=2 tabstop=2
" autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
" autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
"autocmd FileType vim setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4




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

" set paste
let g:set_paste = 0
function SetPaste()
    if g:set_paste == 0
        :set paste
        let g:set_paste = 1
    else
        :set nopaste
        let g:set_paste = 0
    endif
    echo 'g:set_paste:'g:set_paste
endfunction

" license
function InsertLicense()
    let filename = expand('%:t')
    let dot = strridx( filename, "." )
    let suffix = strpart( filename, dot )
    let license_file = printf( "%s%s", "~/.vim/license", suffix )
    exe "read" license_file
endfunction

" setnu/nonu
function SetNumSwitch()
    if g:is_set_nu == 1
        :set nonu
        :TagbarToggle
        let g:is_set_nu = 0
    else
        :set nu
        :TagbarToggle
        let g:is_set_nu = 1
    endif
endfunction




"----------------------------------------
" auto commands
"----------------------------------------
" auto format
"au BufWrite *.rs :Autoformat
"au VimLeave *.rs :Autoformat

" Remember the last position of the cursor.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" au FilterWritePre * if &diff | windo set wrap | endif

" csope
au BufEnter /* call LoadCscope()

" tagbar
if ! &diff
    autocmd Filetype asm,c,cc,CC,cmake,cpp,cweb,go,h,hpp,idl,javascript,lex,make,markdown,mmix,php,python,ruby,rust,scheme,sh,text,toml,vim,yacc,yaml,zsh :TagbarToggle
else
endif



"----------------------------------------
" map
"----------------------------------------
map <F1> :Autoformat<cr><F2>
imap <F1> <esc>:Autoformat<cr><F2>
cmap <F1> <esc>:Autoformat<cr><F2>

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
"map <F6> :NERDTreeToggle<cr>
"imap <F6> <esc>:NERDTreeToggle<cr>i
"cmap <F6> <esc>:NERDTreeToggle<cr>
map <F6> :call SetNumSwitch()<cr>
imap <F6> <esc>:call SetNumSwitch()<cr>
cmap <F6> <esc>:call SetNumSwitch()<cr>


" F7 showtabline
map <F7> :call Showtabline()<cr>
imap <F7> <esc>:call Showtabline()<cr>i
cmap <F7> <esc>:call Showtabline()<cr>


" F8 set paste
map <F8> :call SetPaste()<cr>
imap <F8> <esc>:call SetPaste()<cr>
cmap <F8> <esc>:call SetPaste()<cr>


" F9 w3m
map <F9> :TagbarToggle<cr>:W3m 
imap <F9> <esc>:TagbarToggle<cr>:W3m 
cmap <F9> <esc>:TagbarToggle<cr>:W3m 


" F10 w3m history
map <F10> :TagbarToggle<cr>:W3mHistory<cr>
imap <F10> <esc>:TagbarToggle<cr>:W3mHistory<cr>
cmap <F10> <esc>:TagbarToggle<cr>:W3mHistory<cr>


" F11 set nu/nonu
let g:is_set_nu = 1
map <F11> :call SetNumSwitch()<cr>
imap <F11> <esc>:call SetNumSwitch()<cr>
cmap <F11> <esc>:call SetNumSwitch()<cr>

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
let tagbar_width=45
let tagbar_sort=0
let tagbar_compact=1
let g:tagbar_show_linenumbers=1




"----------------------------------------
" nerdtree
"----------------------------------------
let NERDTreeShowHidden=1
let NERDTreeWinPos="right"
let NERDTreeWinSize=30
let NERDTreeMinimalUI=1




"----------------------------------------
" solarized
"----------------------------------------
let g:solarized_termcolors=256
colorscheme solarized




"----------------------------------------
" racer
"----------------------------------------
set hidden
let g:racer_cmd = '/home/baitu/mozilla/rust/crates/racer/target/release/racer'
let $RUST_SRC_PATH = '/home/baitu/mozilla/rust/rust/src'
imap <C-j> <c-x><c-o>




"----------------------------------------
" autoformat
"----------------------------------------
let g:formatdef_rustfmt = '"/home/baitu/mozilla/rust/crates/rustfmt/target/debug/rustfmt"'
let g:formatters_rust = ['rustfmt']
