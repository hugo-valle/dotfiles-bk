local g = vim.g

require('packerPlugins')
require('settings')                 -- settings
require('keymaps')                  -- keymaps
require('plugins/nvim-tree')	      -- file manager
require('plugins/nvim-cmp')         -- autocomplete
--require('plugins/nvim-autopairs')   -- autopairs
require('plugins/nvim-lspconfig')   -- LSP settings
require('plugins/vista')            -- tag viewer
require('plugins/nvim-treesitter')  -- tree-sitter interface
require('plugins/nvim_comment')     -- line comments
require('plugins/folke_vim_which_key') -- show key bindings
require('plugins/lualine')           -- Status line
require('plugins/lightspeed')        --  motion plugin
require('plugins/floaterm')          -- floating terminal
require('plugins/transparent')       -- remove background to make vim transparent
require('plugins/lspkind')           -- add vscode-like pictograms
require('plugins/vsnip')             -- code snips
require('plugins/ale')               -- linter
require('plugins/vim-templates')     -- file templates
require('plugins/telescope')         -- fuzzy finder
require('plugins/vim-cmake')         -- cmake support

-- Theme
g.onedark_style = 'darker'
-- Other Commmands
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
