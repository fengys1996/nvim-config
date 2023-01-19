if vim.g.is_neovide then
	vim.g.neovide_cursor_animation_length = 0.1

	vim.g.neovide_cursor_trail_size = 0.4

	-- the alt key mapping only for neovide (newer version)
	-- https://github.com/neovide/neovide/pull/1366
	vim.g.neovide_input_macos_alt_is_meta = true

	vim.g.neovide_transparency = 0.9

	vim.g.neovide_hide_mouse_when_typing = true

	vim.g.neovide_confirm_quit = true
end
