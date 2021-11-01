Plug = require 'plugs.vimplug'

-- Begin Pluggins
Plug.begin('~/.config/nvim/plugged')

require('plugs.sensible')   -- compatible mode
require('plugs.nerdtree')   -- explorer navigation
require('plugs.lualine')    -- status line
require('plugs.colors')     -- theme
require('plugs.fugitive')   -- git support
require('plugs.coc')        -- language support
require('plugs.ale')        -- code linting
require('plugs.telescope')  -- fuzzy finder
require('plugs.templates')  -- file templates

-- End Pluggins
Plug.ends()

require'lualine'.setup {options = {theme = wombat}}
vim.cmd 'colorscheme duskfox'
