"=================================================================
"  Revision  3
"  Modified  Tuesday, 09 March 2021
"=================================================================

"=================================================================
" Startify: The fancy start screen for vim {
"=================================================================
" :SLoad    load a session
" :SSave    save a session
" :SDelete  delete a session
" :SClose   close current session
"
Plug 'mhinz/vim-startify'
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 0
let g:startify_bookmarks = [ {'c': '~/.vimrc'} ]
"=================================================================
" Startify: The fancy start screen for vim
" Created by: figlet -f slant "Dr. Valle"
"=================================================================
"let g:startify_custom_header = [
"            \'',
"            \'        ____            _    __      ____   ',
"            \'        / __ \_____     | |  / /___ _/ / /__ ',
"            \'       / / / / ___/     | | / / __ `/ / / _ \',
"            \'      / /_/ / /  _      | |/ / /_/ / / /  __/',
"            \'     /_____/_/  (_)     |___/\__,_/_/_/\___/ ',
"            \'',
"            \'',
"            \]
"} ===
