local bin_path = require("config").language_server_bin_path .. "bin/clangd"

return {
	cmd = { bin_path },
	root_markers = { '.clangd', 'compile_commands.json', '.git' },
	filetypes = { 'c', 'cpp' },
}
