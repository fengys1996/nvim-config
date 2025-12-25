local function on_attach(bufnr)
	local api = require('nvim-tree.api')

	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
	vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
	vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
	vim.keymap.set('n', '<C-h>', api.node.open.horizontal, opts('Open: Horizontal Split'))
	vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
	vim.keymap.set('n', 'i', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
	vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
	vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
	vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
	vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
	vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
	vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
	vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
	vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
	vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
	vim.keymap.set('n', 'w', api.tree.collapse_all, opts('Collapse'))
	vim.keymap.set('n', 'e', api.tree.expand_all, opts('Expand All'))
	vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
	vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
	vim.keymap.set('n', 'I', api.tree.change_root_to_node, opts('CD'))

    vim.cmd("highlight NvimTreeCursorLine guibg=#D9D9D9")
end

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
		width = 50,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
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
			hint = "H",
			info = "I",
			warning = "W",
			error = "E",
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
	on_attach = on_attach,
};


return {
	{
		"kyazdani42/nvim-tree.lua",
		opts = opts,
		dependencies = { "arkav/lualine-lsp-progress", "kyazdani42/nvim-web-devicons" },
		keys = {
			{ "<A-m>",      "<cmd>NvimTreeToggle<cr>", mode = { "n", "i", "t" } },
			{ "<leader>ll", "<cmd>NvimTreeFocus<cr>",  mode = { "n" } },
		},
	}
}
