local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("not found telescope")
	return
end

local keymap = {
	i = {
		-- moving up and down
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		-- history record
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- close search window
		["<C-c>"] = "close",
		-- preview window moves up and down
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

telescope.setup({
	defaults = {
		initial_mode = "insert",
		mappings = keymap,
	},
	pickers = {
		-- optional themes: dropdown, cursor, ivy
		find_files = {
			theme = "ivy",
		},
		live_grep = {
			theme = "ivy",
		},
		lsp_references = {
			theme = "cursor",
		}
	},
	extensions = {},
})
