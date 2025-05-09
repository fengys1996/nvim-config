local module = {}

local capabilities = require('blink.cmp').get_lsp_capabilities()

function module.setup()
	require 'lspconfig'.protols.setup {
		autostart = true,
		capabilities = capabilities,
		on_attach = function(_, bufnr)
			local function mapbuf(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			require("keymap.lsp").maplsp(mapbuf, "proto")
		end,
	}
end

return module
