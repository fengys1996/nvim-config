return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		keys = {
			{ "<leader>rl", ":LspStart<cr>" },
		},
		config = function()
			require("plugins.lsp.lua").setup()
			require("plugins.lsp.golang").setup()
		end

	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
		event = "VeryLazy",
		opts = {
			ensure_installed = { "sumneko_lua", "rust_analyzer", "taplo", "cmake", "gopls" }
		}

	},
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		cmd = "Mason",
		config = true,
	},
}
