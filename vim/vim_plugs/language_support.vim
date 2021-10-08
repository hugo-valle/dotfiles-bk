"=================================================================
"  Revision  15
"  Modified  Sunday, 26 September 2021
"=================================================================

"=================================================================
" Latex Support
"=================================================================
Plug 'xuhdev/vim-latex-live-preview'
let g:livepreview_previewer = 'open -a Preview'

"=================================================================
" Language Support
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
"Template
augroup Python
    autocmd!
    autocmd BufNewFile *.py silent! 0r ~/.vim/templates/python_mode.template | cal cursor(8,4)
augroup END
"} ===


"=================================================================
" Trim whitespace
"=================================================================
Plug 'ntpeters/vim-better-whitespace'
"} ===
