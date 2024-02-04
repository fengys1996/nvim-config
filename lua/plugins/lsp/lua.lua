local module = {}

function module.setup()
	local runtime_path = vim.split(package.path, ';')
	table.insert(runtime_path, 'lua/?.lua')
	table.insert(runtime_path, 'lua/?/init.lua')

	local opts = {
		autostart = true,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're
					-- using (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { 'vim' },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file('', true),
					checkThirdParty = false,
				},
				-- Do not send telemetry data containing a randomized but
				-- unique identifier
				telemetry = {
					enable = false,
				},
				hint = { enable = true }
			},
		},
		flags = {
			debounce_text_changes = 150,
		},
		on_attach = function(_, bufnr)
			local function mapbuf(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			require("keymap.lsp").maplsp(mapbuf)
		end,
	}
	require 'lspconfig'.lua_ls.setup(opts)
end

return module
