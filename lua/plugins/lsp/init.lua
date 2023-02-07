return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig", "williamboman/mason.nvim" },
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
		opts = {
			ensure_installed = { "sumneko_lua", "rust_analyzer", "taplo", "cmake", "gopls" }
		}

	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = true,
	},
}
