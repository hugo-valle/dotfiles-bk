-- Fix files with clang-format and the .clang-format file in the project root
vim.cmd [[
let b:ale_fixers = ['clang-format']
]]

--Auto fix the file on save
vim.cmd [[
let b:ale_fix_on_save = 1
]]

vim.cmd [[
let g:ale_linters = {'python': ['pylint'], 'vim': ['vint'], 'cpp': ['clang'], 'c': ['clang'] }
]]
