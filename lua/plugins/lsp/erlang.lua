local module = {}

local capabilities = require('blink.cmp').get_lsp_capabilities()

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
