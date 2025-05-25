local bin_path = require("config").language_server_bin_path .. "bin/gopls"

return {
	cmd = { bin_path },
	filetypes = { 'go' },
	root_markers = { '.git', 'go.sum', 'go.mod' },
}
