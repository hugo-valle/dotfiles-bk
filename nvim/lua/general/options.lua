-----------------------------------------------------------------
--  Revision  1
--  Modified  Sunday, 26 September 2021
-----------------------------------------------------------------

-- SET OPTIONS
-- +--------------------+------------------------+
-- |       VIM          |   Lua                  |
-- +--------------------+------------------------+
-- | set hlsearch       | vim.o.hlsearch = true  |
-- | set number         | vim.wo.number = true   |
-- | set shiftwidth=4   | vim.bo.shiftwidth = 4  |
-- +--------------------+------------------------+
-- Scopes: 
-- vim.o    -- gets or sets general settings
-- vim.wo   -- gets or sets window-scope options
-- vim.bo   -- gets or sets buffer-scope options
-- vim.g    -- gets or sets global variables
-- vim.env  -- gets or sets environment variables
-- vim.opt  -- gets or sets global, window, and buffer setttings


-- stylua: ignore start
-- Visual
vim.o.conceallevel    = 0 	    -- Make `` Visible in Markdown
vim.o.cmdheight       = 1	    -- Better Error Messages
vim.o.showtabline     = 2 	    -- Always Show Tabline
vim.o.pumheight       = 10      -- Pop up Menu Height
vim.wo.number         = true 	-- Display Line Number 
vim.wo.relativenumber = true 	-- Make relative line numbers default
vim.o.termguicolors   = true	-- Set Terminal Colors
vim.o.title           = true    -- Display File Info on Title
vim.o.showmode        = true	-- Do Show MODES
vim.o.showmatch       = true	-- Show matching brackets / pranthesis
vim.wo.signcolumn     = 'yes'	-- Sign Column
vim.wo.colorcolumn    = '80'    -- color column 
vim.o.textwidth       = 79      -- Width of document (used by gd)
vim.o.ruler           = true    -- Show the line / column number of cursor


-- Behavior
vim.opt.autoindent    = true    -- auto indent
vim.opt.cursorline    = true    -- show cursor line
vim.opt.autowrite     = true    -- auto save file
vim.o.hlsearch        = true 	-- Set highlight on search
vim.o.ignorecase      = true 	-- Case insensitive searching 
vim.o.smartcase       = true	-- If Upper Case Char > case sensitive search
vim.o.smarttab        = true	-- Smart Tabs
vim.o.smartindent     = true 	-- Smart Indenting
vim.o.splitbelow      = true 	-- Force Split Below
vim.o.splitright      = true 	-- Force Split Right
vim.o.expandtab       = true  -- Convert tabs to spaces
local indent = 4
vim.o.tabstop         = indent  -- Tabstop 
vim.o.softtabstop     = indent
vim.o.shiftwidth      = indent
vim.o.scrolloff       = 12  	  -- Vertical Scroll Offset
vim.o.sidescrolloff   = 8  	    -- Horizontal Scroll Offset
vim.o.mouse           = 'a'	    -- Enable mouse mode

-- Vim specific
vim.o.hidden          = true	    -- Do not save when switching buffers
vim.o.breakindent     = true	    -- Enable break indent
vim.o.backup          = false	    -- Disable Backup
vim.o.swapfile        = false	    -- Don't create Swap Files
vim.o.spell           = false
vim.o.undofile        = true 	    -- Save undo history
vim.o.updatetime      = 250	        -- Decrease update time
vim.o.timeoutlen      = 250	        -- Time for mapped sequence to complete (in ms)
vim.o.inccommand      = 'nosplit'   -- Incremental live completion
vim.o.fileencoding    = "utf-8"	    -- Set File Encoding
vim.o.spelllang       = "en"
vim.o.completeopt     = "menuone,noselect"  -- Autocompletion
vim.o.shortmess       = "c"
vim.o.undodir         = vim.fn.stdpath("cache") .. "/undo"
-- stylua: ignore end
vim.opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}


-- Highlight on yank
vim.api.nvim_exec(
[[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]],
false
)

vim.cmd [[
autocmd! BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded $NVIMRC"
]]
