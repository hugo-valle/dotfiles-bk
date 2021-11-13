local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function()
  -- Packer can manage itself
  --comment for neovim
  use {"terrortylor/nvim-comment"}
  use {"tpope/vim-commentary"}

  use {'wbthomason/packer.nvim', opt = true}
  --nvim tree for file explorer
  use {'kyazdani42/nvim-tree.lua'}
  --indentLine
  use {'Yggdroot/indentLine'}
  --autopairs
  use {'windwp/nvim-autopairs'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'liuchengxu/vista.vim'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'navarasu/onedark.nvim'}
  --vsnip for snippets
  use {'onsails/lspkind-nvim'}
  use {
  'nvim-lualine/lualine.nvim', requires = {
    'kyazdani42/nvim-web-devicons',
    opt = true
  } }

  use {
  'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
  'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' }
  }
  -- linter
  use {'dense-analysis/ale'}
  -- ctags
  use {'ludovicchabant/vim-gutentags'}
  -- Templates
  use {'tibabit/vim-templates'}
  -- Tmux
  use {'christoomey/vim-tmux-navigator'}
  -- vimclang
  use {'rhysd/vim-clang-format'}
  use {'cdelledonne/vim-cmake'}  -- cmake support
  use {'alepez/vim-gtest'}       -- gtest support
  -- Floating terminal
  use {'voldikss/vim-floaterm'}
  -- Fast searching
  use {'ggandor/lightspeed.nvim'}
  -- transparent bg
  use { 'xiyaowong/nvim-transparent'}
  --this is for the lsp
  use {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
  }
  use {"nvim-lua/diagnostic-nvim"}
  use {"9mm/vim-closer"}
  use {"folke/which-key.nvim"}
  -- autocompletion
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
    },
  }
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  }
  -- git
  -- Allow :Gbrowse for github and other github support
  use {'tpope/vim-rhubarb'}
  -- ---> git commands within vim <---
  use {'tpope/vim-fugitive'}
  -- ---> git changes on the gutter <---
  use {'airblade/vim-gitgutter'}
end)
