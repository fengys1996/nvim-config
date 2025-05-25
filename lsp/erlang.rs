local bin_path = require("config").language_server_bin_path .. "bin/erlang_ls"

return {
	cmd = { bin_path },
	filetypes = { 'erlang' },
	root_markers = { '.git' },
}
