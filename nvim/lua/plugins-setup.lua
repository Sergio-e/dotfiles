-- Finds or installs Packer
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

-- Runs :PackerSync every time file is opened
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- :PackerSync
	-- :PackerStatus

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- colorscheme
	use({ "ellisonleao/gruvbox.nvim" })

	-- better tmux and panes navigation
	use("christoomey/vim-tmux-navigator")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finder
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- parsing system
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- copilot
	use("github/copilot.vim")

	-- better navigation
	use("ggandor/leap.nvim")
	use("ThePrimeagen/harpoon")

	-- tests
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"olimorris/neotest-rspec",
		},
	})

	-- start screen
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- improve startup time
	use("lewis6991/impatient.nvim")

	-- session manager wrapper
	use("olimorris/persisted.nvim")

  -- notes, wiki
  use("vimwiki/vimwiki")
  use("folke/zen-mode.nvim")

	-- essentials
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("tpope/vim-rails")
	use("tpope/vim-commentary")
	use("tpope/vim-dispatch")
	use("tpope/vim-fugitive")
	use("tpope/vim-endwise")
	use("tpope/vim-bundler")
	use("pbrisbin/vim-mkdir")
	use("dhruvasagar/vim-zoom")

	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
