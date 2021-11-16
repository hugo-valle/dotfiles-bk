-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

--local map = vim.api.nvim_set_keymap
-- need a map method to handle the different kinds of key maps
local function map(mode, combo, mapping, default_opts)
  local options = {noremap = true}
  if default_opts then
    options = vim.tbl_extend('force', options, default_opts)
  end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
map('n', '<CR>', ':noh<CR><CR>', {noremap = true}) -- clears search highlight & still be enter

-- map Esc to kk
map('i', 'jk', '<Esc>', {noremap = true})
map('i', 'kj', '<Esc>', {noremap = true})
map('i', 'jj', '<Esc>', {noremap = true})
map('i', 'kk', '<Esc>', {noremap = true})
--map('i', '<C-c>', '<Esc>', {noremap = true})
--map('n', '<C-c>', '<Esc>', {noremap = true})

-- don't use arrow keys

-- fast saving with <leader> and s
--map('n', '<leader>w', '<C-c>:w<CR>', default_opts)
map('n', '<leader>x', '<C-c>:wq<CR>', default_opts)
map('n', '<leader>so', '<C-c>:source %<CR>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
--map('n', '<C-h>', '<C-w>h', default_opts)
--map('n', '<C-j>', '<C-w>j', default_opts)
--map('n', '<C-k>', '<C-w>k', default_opts)
--map('n', '<C-l>', '<C-w>l', default_opts)
-- Use alt + hjkl to resize windows
map('n', '<M-j>', ':resize -2<CR>')
map('n', '<M-k>', ':resize +2<CR>')
map('n', '<M-h>', ':vertical resize -2<CR>')
map('n', '<M-l>', ':vertical resize +2<CR>')

-- close all windows and exit from neovim
map('n', '<leader>q', ':quitall<CR>', default_opts)

-- Easier moving between buffers
map('n', '<Leader><TAB>', ':bnext<CR>')   -- Next buffer
map('n', '<S-TAB>', ':bprevious<CR>')     -- Previous buffer
-- Easier moving between tabs
map('n', '<Leader>m', '<Esc>:tabprevious<CR>')
map('n', '<Leader>n', '<Esc>:tabnext<CR>')
--map('n', '<Leader>1', '1gt')
--map('n', '<Leader>2', '2gt')
--map('n', '<Leader>3', '3gt')
--map('n', '<Leader>4', '4gt')
--map('n', '<Leader>5', '5gt')
--map('n', '<Leader>6', '6gt')
--map('n', '<Leader>7', '7gt')
--map('n', '<Leader>8', '8gt')
--map('n', '<Leader>9', '9gt')
map('n', 'th', '<Esc>:tabfirst<CR>')  -- first tab
map('n', 'tk', '<Esc>:tabnext<CR>')   -- right tab
map('n', 'tj', '<Esc>:tabprev<CR>')   -- left tab
map('n', 'tl', '<Esc>:tablast<CR>')   -- last tab

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------
-- open terminal

-- nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', default_opts)       -- open/close
map('n', '<leader>re', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
--map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file

-- Vista tag-viewer
map('n', '<C-m>', ':Vista!!<CR>', default_opts)   -- open/close
-- Telescope
map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")
map('n', '<Leader>vrc', "<cmd>lua require('plugins.telescope').search_dotfiles()<cr>")
-- Formating
map('n', '<Leader>r', ':<C-u>ClangFormat<CR>')
-- CMake ang GoogleTest
map('n', '<Leader>cc', ':CMakeClean<CR>', default_opts)  -- Clean
map('n', '<Leader>ci', ':CMakeInstall<CR>', default_opts)  -- Install
map('n', '<Leader>cg', ':CMakeGenerate<CR>', default_opts)  -- Generate
map('n', '<Leader>cb', ':CMakeBuild<CR>', default_opts)  -- Build
map('n', '<Leader>cq', ':CMakeClose<CR>', default_opts)  -- Close Cmake console window
map('n', '<Leader>gt', ':GTestRunUnderCursor<CR>', default_opts)  -- Run GoogleTest cases

-- LSP 
-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', default_opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', default_opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', default_opts)
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', default_opts)
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', default_opts)
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', default_opts)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', default_opts)
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', default_opts)
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', default_opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)
--map('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', default_opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', default_opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', default_opts)
--map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', default_opts)
map('n', '<space>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', default_opts)
