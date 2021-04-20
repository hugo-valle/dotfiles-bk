"=================================================================
"  Revision  10
"  Modified  Sunday, 28 February 2021
"=================================================================

"=================================================================
" ALE Linter <F8> to toggle {
"=================================================================
if has('job') && has ('timers')

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

else
    "=================================================================
    " Syntastic Syntax checking Plugin
    "=================================================================
    " Use :Erorrs to open location-list :lclose
    " :lnext and :lprevious
    Plug 'vim-syntastic/syntastic'
    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_loc_list_height = 5
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_mode_map = {
                \ "mode": "active",
                \ "passive_filetypes": ["python"] }
    "nnoremap <C-F8> :SyntasticToggleMode<CR>
    "nnoremap <F8> :SyntasticCheck<CR>
endif

augroup signcolumn
    autocmd!
    autocmd ColorScheme Gruvbox highlight clear SignColumn    
augroup end
"} ===
