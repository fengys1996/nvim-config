local module = {}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local java_opts = {
	notifications = {
		dap = false,
	},
	root_markers = {
		-- 'settings.gradle',
		-- 'settings.gradle.kts',
		-- 'pom.xml',
		-- 'build.gradle',
		-- 'mvnw',
		-- 'gradlew',
		-- 'build.gradle',
		-- 'build.gradle.kts',
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

		require("keymap.lsp").maplsp(mapbuf, "java")
	end,
}

function module.setup()
	require('java').setup(java_opts)
	require('lspconfig').jdtls.setup(jdtls_opts)
end

return module
