local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local bin_path = require("config").language_server_bin_path .. "bin/lua-language-server"

return {
	cmd = { bin_path },
	filetypes = { 'lua' },
	root_markers = { '.git' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = runtime_path,
			},
			root_markers = { '.git' },
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
			hint = { enable = true }
		},
	},
}
