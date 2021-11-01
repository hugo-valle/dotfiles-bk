--============================================================================
--  Revision  2
--  Modified  Friday, 29 October 2021
-- keybindings.lua
--============================================================================

--============================================================================
-- need a map method to handle the different kinds of key maps
local function map(mode, combo, mapping, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

--============================================================================
-- Set the Leader Key
vim.g.mapleader = ' ' -- change the <leader> key to be comma

-- Sort visual mode selected lines
map('', '<F1>', '<Esc>') -- avoid opening help, treat it like escape (all modes)
map('', 'jk', '<Esc>') -- avoid opening help, treat it like escape (all modes)
map('', 'kj', '<Esc>') -- avoid opening help, treat it like escape (all modes)

map('n', '<CR>', ':noh<CR><CR>', {noremap = true}) -- clears search highlight & still be enter
--map('i', '<C-h>', 'pumvisible() ? deoplete#close_popup() ' ..
  --  			  '"<Plug>(neosnippet_jump_or_expand)": "<CR>"', {expr = true, silent = true})

-- Better window navigation
-- use ctr:+hjkl to move between split/vsplit panels
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Use alt + hjkl to resize windows
map('n', '<M-j>', ':resize -2<CR>')
map('n', '<M-k>', ':resize +2<CR>')
map('n', '<M-h>', ':vertical resize -2<CR>')
map('n', '<M-l>', ':vertical resize +2<CR>')

-- Easier moving between buffers
map('n', '<Leader><TAB>', ':bnext<CR>')   -- Next buffer
map('n', '<S-TAB>', ':bprevious<CR>')     -- Previous buffer


-- <TAB>: completion.
map('i', '<expr><TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"')

-- Easier moving between tabs
map('n', '<Leader>m', '<Esc>:tabprevious<CR>')
map('n', '<Leader>n', '<Esc>:tabnext<CR>')
map('n', '<Leader>1', '1gt')
map('n', '<Leader>2', '2gt')
map('n', '<Leader>3', '3gt')
map('n', '<Leader>4', '4gt')
map('n', '<Leader>5', '5gt')
map('n', '<Leader>6', '6gt')
map('n', '<Leader>7', '7gt')
map('n', '<Leader>8', '8gt')
map('n', '<Leader>9', '9gt')
map('n', 'th', '<Esc>:tabfirst<CR>')  -- first tab
map('n', 'tk', '<Esc>:tabnext<CR>')   -- right tab
map('n', 'tj', '<Esc>:tabprev<CR>')   -- left tab
map('n', 'tl', '<Esc>:tablast<CR>')   -- last tab

-- Keybinding for Plugs
-- Nerdtree
map('n','<C-e>',':NERDTreeToggle<CR>')
map('n','<Leader>f',':NERDTreeFocus<CR>')
-- Telescope
map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")
-- Formating
map('n', '<Leader>r', ':<C-u>ClangFormat<CR>')
