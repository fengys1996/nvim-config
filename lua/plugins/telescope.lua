local tele_shortcut_key = {
	{ "<C-h>",      "<cmd>lua require('telescope.builtin').pickers()<cr>" },
	{ "<leader>P",  "<cmd>Telescope projects<cr>" },

	{ "<C-f>",      "<cmd>lua require('telescope.builtin').find_files()<cr>" },
	{ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" },

	{ "<C-p>",      "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
	{ "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },

	{ "<C-b>",      "<cmd>lua require('telescope.builtin').buffers()<cr>" },
	{ "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>" },

	{ "<C-e>",      "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
	{ "<leader>fe", "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
	{ "<leader>fj", "<cmd>lua require('telescope.builtin').jumplist()<cr>" },
	{ "<leader>fs", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>" },

	{ "<C-e>",      "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
}

local make_tele_key_map = function(actions)
	local keymap = {
		i = {
			-- close search window
			["<C-c>"] = actions.close,

			-- select vertical and horizontal
			["<C-v>"] = actions.select_vertical,
			["<C-h>"] = actions.select_horizontal,

			-- history record
			["<C-n>"] = actions.cycle_history_next,
			["<C-p>"] = actions.cycle_history_prev,

			-- moving up and down
			["<C-j>"] = actions.move_selection_next,
			["<C-k>"] = actions.move_selection_previous,

			-- preview window moves up and down
			["<C-u>"] = actions.preview_scrolling_up,
			["<C-d>"] = actions.preview_scrolling_down,

			-- remove buffer
			["<C-r>"] = actions.delete_buffer + actions.move_to_top,
		},
		n = {
			-- remove buffer
			["r"] = actions.delete_buffer + actions.move_to_top,
		}
	}

	return keymap
end

local load_project_extensions = function()
	local ok, msg = pcall(require("telescope").load_extension, "projects")
	if not ok then
		local err_msg = "failed to load projects, details: " .. msg
		vim.notify(err_msg, vim.log.levels.ERROR, { title = "Telescope" })
		return
	end
end

local load_telescope_tabs = function()
	local ok, msg = pcall(require("telescope").load_extension, "telescope-tabs")
	if not ok then
		local err_msg = "failed to load telescope tabs, details: " .. msg
		vim.notify(err_msg, vim.log.levels.ERROR, { title = "Telescope" })
		return
	end
end

local load_fzf_native = function()
	local ok, msg = pcall(require("telescope").load_extension, "fzf")
	if not ok then
		local err_msg = "failed to load fzf native, details: " .. msg
		vim.notify(err_msg, vim.log.levels.ERROR, { title = "Telescope" })
		return
	end
end

local tele_config = function()
	local actions = require "telescope.actions"

	local keymap = make_tele_key_map(actions)

	local tele_opts = {
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
			oldfiles = {
				cwd_only = true,
			}
		},
		extensions = {},
	};

	require("telescope").setup(tele_opts)
	load_fzf_native()
	load_project_extensions()
	load_telescope_tabs()
end

local project_config = function()
	require("project_nvim").setup({
		manual_mode = true,
		silent_chdir = false,
	})
end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = '0.1.8',
		dependencies = { "nvim-lua/plenary.nvim", "ahmedkhalf/project.nvim", },
		cmd = "Tele",
		keys = tele_shortcut_key,
		config = tele_config,
	},
	{
		"ahmedkhalf/project.nvim",
		config = project_config,
	},
	-- Install native telescope sorter to significantly improve sorting performance.
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
	},
	{
		'LukasPietzschmann/telescope-tabs',
		config = function()
			require('telescope-tabs').setup({
				entry_formatter = function(tab_id, _buffer_ids, file_names, _file_paths, is_current)
					local entry_string = table.concat(file_names, ', ')
					return string.format('%d: %s%s', tab_id, entry_string, is_current and ' <' or '')
				end,
				close_tab_shortcut_i = '<C-r>',
				close_tab_shortcut_n = 'R',
			})
		end,
		keys = {
			{ "<leader>ft", "<cmd>Telescope telescope-tabs list_tabs<cr>" },
		},
		dependencies = { 'nvim-telescope/telescope.nvim' },
	}
}
