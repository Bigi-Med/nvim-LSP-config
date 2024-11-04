-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    } 

    use ({ 
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function ()
			vim.cmd('colorscheme rose-pine')
		end
	})

	--use ({ 
--		'rose-pine/neovim',
--		as = 'rose-pine',
--		config = function ()
--			vim.cmd('colorscheme rose-pine')
--		end
--	})
--
    use('https://github.com/prettier/vim-prettier')
    use {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }
	use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use("windwp/nvim-autopairs")
	use ('theprimeagen/harpoon')
	use ('mbbill/undotree')
    use ('neovim/nvim-lspconfig')
    use ('hrsh7th/nvim-cmp')
    use ('hrsh7th/cmp-nvim-lsp')
    use ('hrsh7th/cmp-buffer')
    use ('hrsh7th/cmp-nvim-lua')
    use ('hrsh7th/cmp-path')
    use ('saadparwaiz1/cmp_luasnip')
	use('L3MON4D3/LuaSnip')
	use('rafamadriz/friendly-snippets')
	use ('tpope/vim-fugitive')
    use ('https://github.com/rstacruz/vim-closer')

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			 {'williamboman/mason.nvim'},
			 {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
end)
