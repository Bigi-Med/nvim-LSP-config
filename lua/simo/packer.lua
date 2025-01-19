-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use('windwp/nvim-autopairs')
    use { 'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('neovim/nvim-lspconfig')
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')
    use('rafamadriz/friendly-snippets')
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')
    use('https://github.com/rstacruz/vim-closer')
    --completion plugin
    use {
        'hrsh7th/nvim-cmp',         -- Core completion plugin
        'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
        'hrsh7th/cmp-buffer',       -- Buffer source for nvim-cmp
        'hrsh7th/cmp-path',         -- Path completion source for nvim-cmp
        'saadparwaiz1/cmp_luasnip', -- Snippet source for nvim-cmp
        'L3MON4D3/LuaSnip'          -- Snippet engine
    }
    use('onsails/lspkind-nvim')
    -- END

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
end)
