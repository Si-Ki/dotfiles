local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end
require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'rust-lang/rust.vim'
    use 'kyazdani42/nvim-web-devicons'
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- Colorschemes
    use 'EdenEast/nightfox.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }

    use 'vimwiki/vimwiki'

    use { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'norcalli/nvim-colorizer.lua'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use {
      "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use 'lukas-reineke/indent-blankline.nvim'
    use 'lewis6991/gitsigns.nvim'

    use {
      'lewis6991/impatient.nvim',
      module = "impatient"
    }

    use {
      'numToStr/Comment.nvim',
      config = function()
      require('Comment').setup()
    end
    }

    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use ('nvim-treesitter/nvim-treesitter-refactor')
    use ('ap/vim-css-color')
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-lua/plenary.nvim'
    use 'BurntSushi/ripgrep'
    use {
        "folke/which-key.nvim",
    config = function()
        require("which-key").setup {}
    end
    }
    if packer_bootstrap then
      require('packer').sync()
    end
end)
