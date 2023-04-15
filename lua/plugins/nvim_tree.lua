local list_keys = {
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	{ key = "i", action = "toggle_ignored" },
	{ key = ".", action = "toggle_dotfiles" },
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
	{ key = "w", action = "collapse_all" },
	{ key = "e", action = "expand_all" },
	{ key = "f", action = "live_filter" },
	{ key = "F", action = "clear_live_filter" },
	{ key = "R", action = "refresh" },
	{ key = "I", action = "toggle_git_ignored" },
	{ key = "<C-k>", action = "", },
	{ key = "-", action = "dir_up" }
}

local opts = {
	auto_reload_on_write = true,
	disable_netrw = false,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	open_on_tab = false,
	sort_by = "name",
	-- project plugin need this config
	update_cwd = true,
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			}
		}
	},
	view = {
		width = 30,
		side = "left",
		preserve_window_proportions = false,
		number = true,
		relativenumber = true,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = list_keys,
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = true,
		custom = {},
		exclude = {},
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		timeout = 400,
	},
	actions = {
		change_dir = {
			enable = false,
			global = false,
			restrict_above_cwd = true,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = { "**/target/" },
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			git = false,
			profile = false,
		},
	},
};


return {
	{
		"kyazdani42/nvim-tree.lua",
		opts = opts,
		dependencies = { "arkav/lualine-lsp-progress", "kyazdani42/nvim-web-devicons" },
		keys = {
			{ "<A-m>", "<cmd>NvimTreeToggle<cr>" },
			{ "<leader>ll", "<cmd>NvimTreeFocus<cr>" },
		},
	}
}
