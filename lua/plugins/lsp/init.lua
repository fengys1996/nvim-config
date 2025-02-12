return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig" },
		config = function()
			require("plugins.lsp.lua").setup()
			require("plugins.lsp.golang").setup()
			require("plugins.lsp.erlang").setup()
			require("plugins.lsp.clangd").setup()
		end

	},
	{
		'nvim-java/nvim-java',
		dependencies = { 'neovim/nvim-lspconfig' },
		enabled = true,
		tag = "v2.1.0",
		config = function()
			require('plugins.lsp.java_').setup()
		end
	},
	{
		'mrcjkb/rustaceanvim',
		version = '^5',
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
			ensure_installed = { "lua_ls", "taplo", "gopls", "clangd" }
		}

	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			PATH = "append",
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
		tag = "v0.5.2",
		config = true,
	},
}
