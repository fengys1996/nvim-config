local capabilities = require('cmp_nvim_lsp').default_capabilities()

local java_opts = {
	notifications = {
		dap = false,
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

return {
	{
		'nvim-java/nvim-java',
		config = function()
			require('java').setup(java_opts)
			require('lspconfig').jdtls.setup(jdtls_opts)
		end
	},
}
