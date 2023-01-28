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

local opt = {
	tools = {
		inlay_hints = {
			auto = true,
		},
	},

	server = server_opt,
}
require('rust-tools').setup(opt)
