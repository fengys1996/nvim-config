local lualine_opts = {
	sections = {
		lualine_c = {
			{
				'filename',
				file_status = true,
				path = 2,
				short_target = 40,
				symbols = {
					modified = '[+]',
					readonly = '[-]',
					unnamed = '[No Name]',
				}
			},
		},
	},
};

return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = lualine_opts,
	}
}
