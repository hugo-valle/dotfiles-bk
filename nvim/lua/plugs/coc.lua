Plug ('neoclide/coc.nvim', {branch = 'release'})

-- Formating
Plug 'rhysd/vim-clang-format'

-- Source configuration
vim.cmd 'source ~/.config/nvim/vim_plugs/coc.vim'
-- Syntax highlight
Plug 'jackguo380/vim-lsp-cxx-highlight'
vim.g['cpp_class_scope_highlight'] = '1'
vim.g['cpp_member_variable_highlight'] = '1'
vim.g['cpp_class_decl_highlight'] = '1'

