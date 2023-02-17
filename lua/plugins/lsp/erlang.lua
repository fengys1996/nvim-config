local module = {}

function module.setup()
	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	require 'lspconfig'.erlangls.setup {
		autostart = false,
		capabilities = capabilities,
		on_attach = function(_, bufnr)
			local function mapbuf(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			require("keymap.lsp").maplsp(mapbuf)
		end,
	}
end

return module
