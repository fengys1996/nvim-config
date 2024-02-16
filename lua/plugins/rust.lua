local capabilities = require('cmp_nvim_lsp').default_capabilities()

local rust_analyzer_settings = {
	["rust-analyzer"] = {
		checkOnSave = {
			enable = true,
			command = "check",
			-- allTargets = false,
			-- extraArgs = { "--target", "riscv64gc-unknown-none-elf" },
		},
	},
}

local server_on_attach = function(client, bufnr)
	local function mapbuf(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	require("keymap.lsp").maplsp(mapbuf)

	local opt = { noremap = true, silent = true }

	-- hover action keymap
	mapbuf("n", "gh", "<cmd>RustLsp hover actions<CR>", opt);

	-- rust runnables ket map
	mapbuf("n", "<leader>ru", "<cmd>RustLsp runnables<CR>", opt)

	-- rust expand macro
	mapbuf("n", "<leader>re", "<cmd>RustLsp expandMacro<CR>", opt)

	mapbuf("n", "<leader>rw", "<cmd>RustLsp reloadWorkspace<CR>", opt)

	mapbuf("n", "<leader>rr", "<cmd>RustLsp flyCheck<CR>", opt)
end

local server_opt = {
	standalone = false,
	settings = rust_analyzer_settings,
	capabilities = capabilities,
	on_attach = server_on_attach,
}

vim.g.rustaceanvim = {
	tools = {},
	server = server_opt,
}

return {
	{
		'mrcjkb/rustaceanvim',
		version = '^4', -- Recommended
		ft = { 'rust' },
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
