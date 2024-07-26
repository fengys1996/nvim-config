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
			-- rust-analyzer is managed by rustup, different toolchains have different rust-analyzers.
			ensure_installed = { "lua_ls", "taplo", "gopls", "clangd" }
		}

	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = true,
	},
}
