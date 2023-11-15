if vim.g.is_neovide then
	vim.g.neovide_cursor_animation_length = 0

	vim.g.neovide_cursor_trail_size = 0.4

	if vim.g.is_mac then
		vim.g.neovide_input_macos_alt_is_meta = true
	end

	vim.g.neovide_transparency = 1.0

	vim.g.neovide_hide_mouse_when_typing = true

	vim.g.neovide_confirm_quit = true
end
