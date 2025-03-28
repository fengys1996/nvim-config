local gitsigns_opts = {
	on_attach = function(bufnr)
		local gitsigns = require('gitsigns')

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']c', function()
			if vim.wo.diff then
				vim.cmd.normal({ ']c', bang = true })
			else
				gitsigns.nav_hunk('next')
			end
		end)

		map('n', '[c', function()
			if vim.wo.diff then
				vim.cmd.normal({ '[c', bang = true })
			else
				gitsigns.nav_hunk('prev')
			end
		end)

		-- Actions
		map('n', '<leader>hs', gitsigns.stage_hunk)
		map('n', '<leader>hr', gitsigns.reset_hunk)
		map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
		map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
		map('n', '<leader>hS', gitsigns.stage_buffer)
		map('n', '<leader>hu', gitsigns.undo_stage_hunk)
		map('n', '<leader>hR', gitsigns.reset_buffer)
		map('n', '<leader>hp', gitsigns.preview_hunk)
		map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
		map('n', '<leader>hd', gitsigns.diffthis)
		map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
		-- map('n', '<leader>td', gitsigns.toggle_deleted)
	end
}

return {
	{
		"lewis6991/gitsigns.nvim",
		-- Why this commit?
		-- See https://github.com/lewis6991/gitsigns.nvim/issues/1127.
		tag = "v0.8.1",
		event = "VeryLazy",
		config = function()
			require('gitsigns').setup(gitsigns_opts)
		end,
	},
	{
		"tpope/vim-fugitive",
		tag = "v3.7",
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
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"tpope/vim-rhubarb",
		event = "VeryLazy",
		config = function()
		end,
	}
}
