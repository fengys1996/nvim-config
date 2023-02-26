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
		["<C-v>"] = "select_vertical",
		["<C-h>"] = "select_horizontal",
	},
}

local opts = {
	defaults = {
		initial_mode = "insert",
		mappings = keymap,
		cache_picker = {
			num_pickers = -1,
			limit_entries = 100,
		},
	},
	pickers = {
		-- optional themes: dropdown, cursor, ivy
		find_files = {
			theme = "ivy",
		},
		live_grep = {
			theme = "ivy",
		},
		-- lsp_references = {
		-- 	theme = "cursor",
		-- }
	},
	extensions = {},
};

local keys = {
	{ "<C-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
	{ "<C-p>", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
	{ "<C-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>" },
	{ "<C-e>", "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
	{ "<C-r>", "<cmd>lua require('telescope.builtin').pickers()<cr>" },
	{ "<leader>P", "<cmd>Telescope projects<cr>" },
}

local config = function()
	require("telescope").setup(opts)
	pcall(require("telescope").load_extension, "projects")
end

return {
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				silent_chdir = false,
				detection_methods = { "pattern" },
				patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln" },
			})
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "ahmedkhalf/project.nvim", },
		cmd = "Telescope",
		keys = keys,
		config = config,
	}
}
