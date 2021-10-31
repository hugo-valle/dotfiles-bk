Plug 'deoplete-plugins/deoplete-clang'
Plug 'dense-analysis/ale'

vim.cmd [[
let g:ale_linters = {'python': ['pylint'], 'vim': ['vint'], 'cpp': ['clang'], 'c': ['clang'] }
]]


