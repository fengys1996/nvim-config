local octo_opts = {
	use_local_fs = false, -- use local files on right side of reviews
	enable_builtin = false, -- shows a list of builtin actions when no action is provided
	default_remote = { "upstream", "origin" }, -- order to try remotes
	ssh_aliases = {}, -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
	reaction_viewer_hint_icon = "", -- marker for user reactions
	user_icon = " ", -- user icon
	timeline_marker = "", -- timeline marker
	timeline_indent = "2", -- timeline indentation
	right_bubble_delimiter = "", -- bubble delimiter
	left_bubble_delimiter = "", -- bubble delimiter
	github_hostname = "", -- GitHub Enterprise host
	snippet_context_lines = 4, -- number or lines around commented lines
	gh_env = {}, -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
	timeout = 5000, -- timeout for requests between the remote server
	ui = {
		use_signcolumn = true, -- show "modified" marks on the sign column
	},
	issues = {
		order_by = {
			-- criteria to sort results of `Octo issue list`
			-- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
			field = "CREATED_AT",
			direction =
			"DESC" -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
		}
	},
	pull_requests = {
		order_by = {
			-- criteria to sort the results of `Octo pr list`
			-- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
			field = "CREATED_AT",
			direction =
			"DESC" -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
		},
		always_select_remote_on_create =
		"false" -- always give prompt to select base remote repo when creating PRs
	},
	file_panel = {
		size = 10, -- changed files panel rows
		use_icons = true -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
	},
	mappings = {
		issue = {
			close_issue = { lhs = "<space>ic", desc = "close issue" },
			reopen_issue = { lhs = "<space>io", desc = "reopen issue" },
			list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
			reload = { lhs = "<C-r>", desc = "reload issue" },
			open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
			copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
			add_assignee = { lhs = "<space>aa", desc = "add assignee" },
			remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
			create_label = { lhs = "<space>lc", desc = "create label" },
			add_label = { lhs = "<space>la", desc = "add label" },
			remove_label = { lhs = "<space>ld", desc = "remove label" },
			goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
			add_comment = { lhs = "<space>ca", desc = "add comment" },
			delete_comment = { lhs = "<space>cd", desc = "delete comment" },
			next_comment = { lhs = "]c", desc = "go to next comment" },
			prev_comment = { lhs = "[c", desc = "go to previous comment" },
			react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
			react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
			react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
			react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
			react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
			react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
			react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
			react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
		},
		pull_request = {
			checkout_pr = { lhs = "<space>po", desc = "checkout PR" },
			merge_pr = { lhs = "<space>pm", desc = "merge commit PR" },
			squash_and_merge_pr = { lhs = "<space>psm", desc = "squash and merge PR" },
			list_commits = { lhs = "<space>pc", desc = "list PR commits" },
			list_changed_files = { lhs = "<space>pf", desc = "list PR changed files" },
			show_pr_diff = { lhs = "<space>pd", desc = "show PR diff" },
			add_reviewer = { lhs = "<space>va", desc = "add reviewer" },
			remove_reviewer = { lhs = "<space>vd", desc = "remove reviewer request" },
			close_issue = { lhs = "<space>ic", desc = "close PR" },
			reopen_issue = { lhs = "<space>io", desc = "reopen PR" },
			list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
			reload = { lhs = "<C-r>", desc = "reload PR" },
			open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
			copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
			goto_file = { lhs = "gf", desc = "go to file" },
			add_assignee = { lhs = "<space>aa", desc = "add assignee" },
			remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
			create_label = { lhs = "<space>lc", desc = "create label" },
			add_label = { lhs = "<space>la", desc = "add label" },
			remove_label = { lhs = "<space>ld", desc = "remove label" },
			goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
			add_comment = { lhs = "<space>ca", desc = "add comment" },
			delete_comment = { lhs = "<space>cd", desc = "delete comment" },
			next_comment = { lhs = "]c", desc = "go to next comment" },
			prev_comment = { lhs = "[c", desc = "go to previous comment" },
			react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
			react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
			react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
			react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
			react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
			react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
			react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
			react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
		},
		review_thread = {
			goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
			add_comment = { lhs = "<space>ca", desc = "add comment" },
			add_suggestion = { lhs = "<space>sa", desc = "add suggestion" },
			delete_comment = { lhs = "<space>cd", desc = "delete comment" },
			next_comment = { lhs = "]c", desc = "go to next comment" },
			prev_comment = { lhs = "[c", desc = "go to previous comment" },
			select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
			select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
			close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
			react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
			react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
			react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
			react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
			react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
			react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
			react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
			react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
		},
		submit_win = {
			approve_review = { lhs = "<C-a>", desc = "approve review" },
			comment_review = { lhs = "<C-m>", desc = "comment review" },
			request_changes = { lhs = "<C-r>", desc = "request changes review" },
			close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
		},
		review_diff = {
			add_review_comment = { lhs = "<space>ca", desc = "add a new review comment" },
			add_review_suggestion = { lhs = "<space>sa", desc = "add a new review suggestion" },
			focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
			toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
			next_thread = { lhs = "]t", desc = "move to next thread" },
			prev_thread = { lhs = "[t", desc = "move to previous thread" },
			select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
			select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
			close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
			toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
			goto_file = { lhs = "gf", desc = "go to file" },
		},
		file_panel = {
			next_entry = { lhs = "j", desc = "move to next changed file" },
			prev_entry = { lhs = "k", desc = "move to previous changed file" },
			select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
			refresh_files = { lhs = "R", desc = "refresh changed files panel" },
			focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
			toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
			select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
			select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
			close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
			toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
		}
	}
};

local gitsign_config = function()
	require('gitsigns').setup {
		-- signs                        = {
		-- 	add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
		-- 	change       = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
		-- 	delete       = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		-- 	topdelete    = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		-- 	changedelete = { hl = 'GitSignsChange', text = '-', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
		-- 	untracked    = { hl = 'GitSignsAdd', text = 'u', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
		-- },
		signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir                 = {
			interval = 1000,
			follow_files = true
		},
		attach_to_untracked          = true,
		current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts      = {
			virt_text = true,
			virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
		sign_priority                = 6,
		update_debounce              = 100,
		status_formatter             = nil, -- Use default
		max_file_length              = 40000, -- Disable if file is longer than this (in lines)
		preview_config               = {
			-- Options passed to nvim_open_win
			border = 'single',
			style = 'minimal',
			relative = 'cursor',
			row = 0,
			col = 1
		},
		yadm                         = {
			enable = false
		},
		on_attach                    = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map('n', ']c', function()
				if vim.wo.diff then return ']c' end
				vim.schedule(function() gs.next_hunk() end)
				return '<Ignore>'
			end, { expr = true })

			map('n', '[c', function()
				if vim.wo.diff then return '[c' end
				vim.schedule(function() gs.prev_hunk() end)
				return '<Ignore>'
			end, { expr = true })

			-- Actions
			map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
			map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
			map('n', '<leader>hS', gs.stage_buffer)
			map('n', '<leader>hu', gs.undo_stage_hunk)
			map('n', '<leader>hR', gs.reset_buffer)
			map('n', '<leader>hp', gs.preview_hunk)
			map('n', '<leader>hb', function() gs.blame_line { full = true } end)
			-- map('n', '<leader>tb', gs.toggle_current_line_blame)
			map('n', '<leader>hd', gs.diffthis)
			-- map('n', '<leader>hD', function() gs.diffthis('~') end)
			-- map('n', '<leader>td', gs.toggle_deleted)

			-- Text object
			map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
		end
	}
end

return {
	{
		"lewis6991/gitsigns.nvim",
		tag = "v0.7",
		event = "VeryLazy",
		config = gitsign_config,
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
		config = function()
		end,
	},
	{
		"junegunn/gv.vim",
		event = "VeryLazy",
		config = function()
		end,
	},
	{
		'pwntester/octo.nvim',
		enabled = false,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "kyazdani42/nvim-web-devicons" },
		opts = octo_opts,
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		config = true,
	},
}
