"----------------------------------------
" settings
"----------------------------------------
set cin
set cindent




"----------------------------------------
" abbreviation 
"----------------------------------------
"ab #i #include
"ab #d #define
"ab #e #endif
"ab ifndef ifndef!cursor!<cr><cr>#endif<cr><Esc>:call search('!cursor!','b')<cr>cf!

"ab main( main( int argc, char* argv[] )<cr>{<cr>}<esc>O

"ab if if (
"ab switch switch (
"ab for for (
"ab while while (




"----------------------------------------
" error msg 
"----------------------------------------
match errormsg /[\t]/

