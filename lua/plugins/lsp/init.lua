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
		enabled = false,
		tag = "v2.0.0",
		config = function()
			require('plugins.lsp.java').setup()
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
		config = function()
			require("mason").setup({
				PATH = "append",
			})
		end
	},
	{
		"saecki/crates.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		event = "VeryLazy",
		tag = "v0.5.2",
		config = true,
	},
	{
		"Fengys123/nvim-checker",
		keys = {
			{ "<leader>cl", ":lua require'nvim-checker'.clippy()<CR>" },
			{ "<leader>ch", ":lua require'nvim-checker'.check()<CR>" },
			{ "<leader>ct", ":lua require'nvim-checker'.test()<CR>" },
		},
		config = function()
		end
	}

}
