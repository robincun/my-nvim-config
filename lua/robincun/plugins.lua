-- der bums kümmert sich um das installieren von packeten.
-- beim neu aufsetzen der nvim config wird dieser Teil am wahrscheinlichsten probleme machen, da packer installiert sein muss und die packete installiert sein müssen
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here
	-- use 'foo1/bar1.nvim'
	-- use 'foo2/bar2.nvim'
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("morhetz/gruvbox")
	use({
		"williamboman/mason.nvim",
	})
	use({
		"neovim/nvim-lspconfig",
	})
	use({
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	})
	use("rafamadriz/friendly-snippets")

	use("stevearc/conform.nvim")
	use("mfussenegger/nvim-lint")
	use({
		"kyazdani42/nvim-tree.lua",
		tag = "nightly",
		requires = "kyazdani42/nvim-web-devicons",
		config = [[require('config.nvim-tree')]],
	})

	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("windwp/nvim-autopairs")
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("folke/tokyonight.nvim")
	use("xiyaowong/transparent.nvim")
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
