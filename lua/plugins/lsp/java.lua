local module = {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local java_opts = {
	notifications = {
		dap = false,
	},
	root_markers = {
		'.git',
	},
}

local jdtls_opts = {
	autostart = false,
	capabilities = capabilities,
	on_attach = function(_, bufnr)
		local function mapbuf(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		require("keymap.lsp").maplsp(mapbuf)
	end,
}

function module.setup()
	require('java').setup(java_opts)
	require('lspconfig').jdtls.setup(jdtls_opts)
end

return module
