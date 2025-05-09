local module = {}

local capabilities = require('blink.cmp').get_lsp_capabilities()

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
	spring_boot_tools = {
		enable = false,
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
