return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig" },
		keys = {
			{ "<leader>rl", ":LspStart<cr>" },
		},
		config = function()
			require("plugins.lsp.lua").setup()
			require("plugins.lsp.golang").setup()
			require("plugins.lsp.erlang").setup()
			require("plugins.lsp.clangd").setup()
		end

	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			-- ensure_installed = { "lua_ls", "rust_analyzer", "taplo", "cmake", "gopls", "erlangls", "clangd" }
			ensure_installed = { "lua_ls", "rust_analyzer", "taplo", "gopls", "clangd" }
		}

	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = true,
	},
}
