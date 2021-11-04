local g = vim.g

require('packerPlugins')
require('settings')                 -- settings
require('keymaps')                  -- keymaps
require('plugins/nvim-tree')	      -- file manager
require('plugins/nvim-cmp')         -- autocomplete
require('plugins/nvim-autopairs')   -- autopairs
require('plugins/nvim-lspconfig')   -- LSP settings
require('plugins/vista')            -- tag viewer
require('plugins/nvim-treesitter')  -- tree-sitter interface
require('plugins/nvim_comment')
require('plugins/folke_vim_which_key')
require('plugins/lualine')
require('plugins/lightspeed')
require('plugins/floaterm')
require('plugins/transparent')
require('plugins/lspkind')
require('plugins/vsnip')
require('plugins/ale')
require('plugins/vim-templates')

g.onedark_style = 'darker'
vim.api.nvim_command('set timeoutlen=100 ttimeoutlen=0')
vim.api.nvim_exec(
[[
hi VertSplit ctermbg=NONE guibg=NONE
set fillchars+=vert:│
set colorcolumn=0
hi FloatermBorder guibg=none guifg=none
highlight VertSplit guibg=NONE
]]
,true)