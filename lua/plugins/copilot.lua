-- vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')
-- Cycle to the next suggestion, if one is available.
vim.keymap.set('i', '<C-j>', '<Plug>(copilot-next)')
return {
	{
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
		end,
	},
}
