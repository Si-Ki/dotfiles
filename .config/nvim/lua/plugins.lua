local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Reload packer on saving this file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

--Have packer in a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use 'lewis6991/impatient.nvim'

    use { 'rust-lang/rust.vim', ft = '.rs' }
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
    use 'norcalli/nvim-colorizer.lua'

    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    }

    -- Load cmp stuff in insert mode only.

    use {
      'rafamadriz/friendly-snippets',
      module = { "cmp", "cmp_nvim_lsp" },
      event = "InsertEnter"
    }

    use {
      'hrsh7th/nvim-cmp',
      after = "friendly-snippets",
    }

    use {
      'L3MON4D3/LuaSnip',
      wants = "friendly-snippets",
      after = "nvim-cmp"
    }

    use 'hrsh7th/cmp-cmdline'
    use {'saadparwaiz1/cmp_luasnip', after = "LuaSnip" }
    use {'hrsh7th/cmp-nvim-lua', after = "cmp_luasnip" }
    use {'hrsh7th/cmp-nvim-lsp', after = "cmp-nvim-lua" }
    use {'hrsh7th/cmp-buffer', after = "cmp-nvim-lsp" }
    use {'hrsh7th/cmp-path', after = "cmp-buffer" }

    use {
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
        config = function()
          require("nvim-autopairs").setup()
        end
    }

    use 'lukas-reineke/indent-blankline.nvim'
    use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
    }

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

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
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
      }

    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'BurntSushi/ripgrep'
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }

    use {
        "goolord/alpha-nvim",
        on = "VimEnter",
        config = function()
            require("alpha-config").setup()
        end,
    }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
