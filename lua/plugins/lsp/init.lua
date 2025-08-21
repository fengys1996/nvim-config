return {
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig" },
	-- 	config = function()
	-- 	end
	-- },
	{
		"mfussenegger/nvim-jdtls",
		  ft = { 'java' },
	},
	{
		-- 'mrcjkb/rustaceanvim',
		'fengys1996/rustaceanvim',
		branch = 'fix/standalone-support',
		-- dir = '/home/fys/projects/rustaceanvim',
		-- version = '^6',
		ft = { 'rust' },
		config = function()
			require('plugins.lsp.rust').setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			-- rust-analyzer is managed by rustup, different toolchains have different rust-analyzers.
			-- ensure_installed = { "lua_ls", "taplo", "gopls", "clangd" }
		}

	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			-- install_root_dir = require("config").language_server_bin_path,
			-- PATH = "append",
			registries = {
				-- https://github.com/nvim-java/nvim-java/issues/315
				'github:nvim-java/mason-registry',
				'github:mason-org/mason-registry',
			}
		}
	},
	{
		"saecki/crates.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		event = "VeryLazy",
		tag = "v0.6.0",
		config = true,
	},
}
