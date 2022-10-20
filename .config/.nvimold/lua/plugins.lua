local M = {}

function M.setup()

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

	-- packer.nvim configuration
	local conf = {
		profile = {
			enable = true,
			threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},

		display = {
			open_fn = function ()
				return require("packer.util").float ()
			end,
		},
	}

	-- Check if packer.nvim is installed
	-- Run PackerCompile if there are changes in this file
	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system {
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
			}
			vim.cmd [[packadd packer.nvim]]
		end
		vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerSync"
	end

	-- Plugins
local function plugins(use)
  use { 'wbthomason/packer.nvim' }
  use { 'nvim-lua/plenary.nvim', module = "plenary" }
  use 'lewis6991/impatient.nvim'

-- Better Icons
  use {
    'kyazdani42/nvim-web-devicons',
    module = "nvim-web-devicons",
    config = function ()
      require("nvim-web-devicons").setup{ default = true }
    end,
  }

  use {
  'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  config = function () require('gitsigns').setup() end
  }

-- File Browser
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function ()
      require("config.nvim-tree")
    end,
  }

  -- Colorschemes
  use 'EdenEast/nightfox.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

-- Autocompletion

	use {
		"hrsh7th/nvim-cmp",
		config = function ()
			require("config.cmp").setup()
		end,
	}

	use {
		"hrsh7th/cmp-buffer",
	}

	use {
		"hrsh7th/cmp-nvim-lsp",
	}

	use {
		"danymat/neogen",
		config = function ()
			require('neogen').setup {}
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	}

-- Lsp stuff

use {
			"neovim/nvim-lspconfig",
			config = function()
				require("config.lsp")
			end,
		}
		use {
			"jose-elias-alvarez/null-ls.nvim",
		}
		use {
			"RRethy/vim-illuminate",
		}
		use {
			"williamboman/mason.nvim",
			config = function()
				require("config.lsp.mason").setup()
			end,
		}
		use {
			"williamboman/mason-lspconfig.nvim",
		}

-- Snippets
	use {
		"L3MON4D3/LuaSnip",
	}

	use {
		"rafamadriz/friendly-snippets",
	}

-- Vimwiki
  use 'vimwiki/vimwiki'

-- Colorize hexcodes

  use 'ap/vim-css-color'

-- AutoPair
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
      config = function ()
        require("nvim-autopairs").setup()
      end
  }

-- indent-blankline
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufReadPre",
  }

-- Markdown previews
  use {
    "iamcco/markdown-preview.nvim",
    cmd = "MarkdownPreview",
    run = "cd app && npm install",
    setup = function ()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = "markdown",
  }

-- Ez comments
  use {
    'numToStr/Comment.nvim',
    config = function ()
      require('Comment').setup()
    end
  }

-- Bufferbar
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function ()
      require("config.barbar").setup()
    end
  }

-- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      require("config.lualine").setup()
    end,
  }

-- Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate",
      config = function ()
        require("config.treesitter").setup()
      end,
    }

-- Telescope
  use {
      "nvim-telescope/telescope.nvim",
      tag = '0.1.0',
      requires = {'nvim-lua/plenary.nvim'},
      config = function ()
        require("config.telescope")
      end,
  }

  use {
    "goolord/alpha-nvim",
    config = function ()
      require("config.alpha").setup()
    end
  }

-- Which key
  use {
      "folke/which-key.nvim",
      config = function ()
          require("config.which-key").setup()
      end
  }

if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
