local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- theme
	use 'folke/tokyonight.nvim'

	use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }

	use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } }
	use 'arkav/lualine-lsp-progress'

	use 'nvim-treesitter/nvim-treesitter'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use 'simrat39/rust-tools.nvim'
	use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }

	use {
		'saecki/crates.nvim',
		event = { "BufRead Cargo.toml" },
		tag = 'v0.2.1',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('crates').setup()
		end,
	}
	use 'hrsh7th/nvim-cmp'

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/vim-vsnip'

	use {
		'windwp/nvim-autopairs',
		config = function() require('nvim-autopairs').setup {} end
	}
	use { 'phaazon/hop.nvim', tag = "v1.3.0" }
	use 'lukas-reineke/indent-blankline.nvim'
	use 'numToStr/Comment.nvim'
	use 'simrat39/symbols-outline.nvim'
	-- use 'mhinz/vim-signify'

	use { 'lewis6991/gitsigns.nvim', tag = 'v0.5' }
	use 'tpope/vim-fugitive'
	use { "folke/trouble.nvim", requires = { "kyazdani42/nvim-web-devicons" } }

	use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
	-- use 'glepnir/dashboard-nvim'
	use 'ahmedkhalf/project.nvim'
	use 'lewis6991/impatient.nvim'
	-- use { 'Shatur/neovim-session-manager', require = { 'nvim-lua/plenary.nvim' } }
	use 'tpope/vim-surround'
	use 'stevearc/dressing.nvim'
	use 'Fengys123/nvim-checker'
	use 'nvim-orgmode/orgmode'
	use 'RRethy/vim-illuminate'
	use 'nvim-zh/better-escape.vim'
	use 'danilamihailov/beacon.nvim'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)

------- Plugins are automatically installed every time you save this file ------
-- pcall(
-- 	vim.cmd,
-- 	[[
--     augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--     augroup end
--   ]]
-- )
