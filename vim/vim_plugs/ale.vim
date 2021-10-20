"=================================================================
"  Revision  16
"  Modified  Tuesday, 09 March 2021
"=================================================================

"=================================================================
" ALE Linter <F8> to toggle {
"=================================================================
Plug 'w0rp/ale'
set noshowmode
let g:airline#extensions#ale#enabled = 1
"    let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
"    let g:ale_c_cppcheck_options = '--enable=style' " --suppress=memleak:src/file1.cpp src/
let g:ale_history_log_output=1  " use ALEInfo to see the full output if needed

" Write this in your vimrc file
"let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
"let g:ale_keep_list_window_open = 0
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1


augroup signcolumn
    autocmd!
    autocmd ColorScheme Gruvbox highlight clear SignColumn    
augroup end
"} ===
