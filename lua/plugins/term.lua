local opts = {
	size = function(term)
		if term.direction == "horizontal" then
			return 25
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.3
		end
	end,
	open_mapping = [[<leader>t]],
	start_in_insert = false,
};

return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = opts,
	},
}
