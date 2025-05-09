local opts = {
	ensure_installed = { "lua", "rust", "toml", "java", "go", "comment" },
	auto_install = true,
	highlight = {
		enable = true,
		disable = { "rust" },
		additional_vim_regex_highlighting = false,
	},
	ident = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		-- max_file_lines = nil,
	}
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
