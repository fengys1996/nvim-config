local bin_path = require("config").language_server_bin_path .. "bin/protols"

return {
	cmd = { bin_path },
	filetypes = { 'proto' },
	root_markers = { '.git' },
}
