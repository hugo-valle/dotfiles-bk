"=================================================================
"  Revision  17
"  Modified  Wednesday, 03 March 2021
"=================================================================

"=================================================================
" Latex Support
"=================================================================
Plug 'xuhdev/vim-latex-live-preview'
let g:livepreview_previewer = 'open -a Preview'

"=================================================================
" Language Support: C and Bash
"=================================================================
Plug 'WolfgangMehner/c-support'
let g:C_Mapleader = "\<Space>"            " set leader key
let g:C_CreateMenusDelayed = 'yes'
let g:C_UseToolbox = 'yes'
let g:C_UseTool_doxygen = 'yes'
let g:C_UseTool_cmake = 'yes'
"
Plug 'WolfgangMehner/bash-support'
let g:Bash_Mapleader = "\<Space>"            " set leader key
"Plug 'WolfgangMehner/latex-support'
"let g:Latex_MapLeader  = ','
"Plug 'WolfgangMehner/lua-support'
"let g:Lua_MapLeader  = ','
"Plug 'WolfgangMehner/perl-support'
"let g:Perl_MapLeader  = ','
"Plug 'WolfgangMehner/vim-support'
"let g:Vim_MapLeader  = ','
"Plug 'WolfgangMehner/python-support'
"let g:Python_MapLeader  = ','


"=================================================================
" Python mode
"=================================================================
Plug 'python-mode/python-mode'
Plug 'davidhalter/jedi-vim'
"Plug 'ycm-core/YouCompleteMe'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }
Plug 'frazrepo/vim-rainbow'

"Template
augroup Python
    autocmd!
    autocmd BufNewFile *.py silent! 0r ~/.vim/templates/python_mode.template | cal cursor(8,4)
augroup END
"} ===
