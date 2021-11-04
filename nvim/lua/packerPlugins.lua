local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function()
  -- Packer can manage itself
  --comment for neovim
  use {"terrortylor/nvim-comment"}

  use {'wbthomason/packer.nvim', opt=true}
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
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {'onsails/lspkind-nvim'}

  use { 'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true} }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  -- linter
  use {'dense-analysis/ale'}
  -- Templates
  use {'tibabit/vim-templates'}
  -- Tmux
  use {'christoomey/vim-tmux-navigator'}

  use {'voldikss/vim-floaterm'}
  use {'ggandor/lightspeed.nvim'}
  use {'xiyaowong/nvim-transparent'}
  --this is for the lsp
  use {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
  }
  use {"folke/which-key.nvim"}
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
end)
