local module = {}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

function module.setup()
	require 'lspconfig'.erlangls.setup {
		autostart = false,
		capabilities = capabilities,
		on_attach = function(_, bufnr)
			local function mapbuf(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			require("keymap.lsp").maplsp(mapbuf, "erlang")
		end,
	}
end

return module
