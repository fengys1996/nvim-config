local config = function()
	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	local server_opt = {
		autostart = false,
		settings = {
			standalone = false,
			["rust-analyzer"] = {
				checkOnSave = {
					enable = true,
					command = "check"
				},
			},
		},
		capabilities = capabilities,
		on_attach = function(_, bufnr)
			local function mapbuf(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			require("keymap.lsp").maplsp(mapbuf)

			local opt = { noremap = true, silent = true }

			-- hover action keymap
			mapbuf("n", "gh", "<cmd>lua require('rust-tools').hover_actions.hover_actions()<CR>", opt);

			-- rust runnables ket map
			mapbuf("n", "<leader>ru", "<cmd>lua require('rust-tools').runnables.runnables()<CR>", opt)

			-- rust expand macro
			mapbuf("n", "<leader>re", "<cmd>lua require('rust-tools').expand_macro.expand_macro()<CR>", opt)
		end,
	}

	local opts = {
		tools = {
			inlay_hints = {
				auto = true,
			},
		},

		server = server_opt,
	}
	require("rust-tools").setup(opts);
end

return {
	{
		"simrat39/rust-tools.nvim",
		event = "VeryLazy",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/nvim-cmp", "neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim", },
		config = config,
	},
	{
		"saecki/crates.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		event = "VeryLazy",
		tag = "v0.3.0",
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
