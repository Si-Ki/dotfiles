local vim = vim
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Colors
    use({
        'rose-pine/neovim',
        as = 'rose-pine'
    })

    vim.cmd('colorscheme rose-pine')

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Ez comments
    use({
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup()
            require('Comment').setup({
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    line = '<leader>/',
                    block = 'gbc',
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    line = '<leader>/',
                    block = 'gb',
                },
                mappings = {
                    basic = true,
                    extra = true,
                },
            })
        end
    })

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
        config = function()
            require'colorizer'.setup()
        end
    }

    -- Lsp stuff
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

end)
