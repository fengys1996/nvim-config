local status, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("not found nvim_treesitter")
	return
end

nvim_treesitter.setup {
	ensure_installed = { "lua", "rust", "toml" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	ident = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
}
