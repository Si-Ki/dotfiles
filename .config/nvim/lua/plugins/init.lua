vim.cmd "packadd packer.nvim"

require('packer').startup({
  function(use)
    -- Packer can manage itself

    use "wbthomason/packer.nvim"

    use 'lewis6991/impatient.nvim'

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Colors
    use { 'nyoom-engineering/oxocarbon.nvim' }

    use {
      'rose-pine/neovim',
      as = 'rose-pine'
    }

    -- vim.cmd('colorscheme rose-pine')

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- Ez comments
    use {
      "numToStr/Comment.nvim",
      module = "Comment",
      setup = function()
        require("plugins.configs.comment")
      end,
    }

    -- Indent blankline
    use {
      "lukas-reineke/indent-blankline.nvim",
      opt = true,
      setup = function()
        require("siki.lazy_load").on_file_open "indent-blankline.nvim"
      end,
      config = function()
        require "plugins.configs.blankline"
      end
    }

    -- Autopairs
    use {
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = function()
        require("nvim-autopairs").setup()
      end,
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" }
    }

    -- Colorizer
    use {
      'norcalli/nvim-colorizer.lua',
      opt = true,
      setup = function()
        require("siki.lazy_load").on_file_open "nvim-colorizer.lua"
      end,
      config = function()
        require "plugins.configs.colorizer"
      end
    }

    -- Lsp stuff
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },           -- Required
        { 'williamboman/mason.nvim' },         -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },       -- Required
        { 'hrsh7th/cmp-nvim-lsp' },   -- Required
        { 'hrsh7th/cmp-buffer' },     -- Optional
        { 'hrsh7th/cmp-path' },       -- Optional
        { 'saadparwaiz1/cmp_luasnip' }, -- Optional
        { 'hrsh7th/cmp-nvim-lua' },   -- Optional

        -- Snippets
        { 'L3MON4D3/LuaSnip' },           -- Required
        { 'rafamadriz/friendly-snippets' }, -- Optional
      }
    }
  end,
  config = {
    auto_clean = true,
    compile_on_sync = true,
    git = { clone_timeout = 6000 },
    display = {
      working_sym = "ﲊ",
      error_sym = "✗ ",
      done_sym = " ",
      removed_sym = " ",
      moved_sym = "",
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end
    },
  }
})
