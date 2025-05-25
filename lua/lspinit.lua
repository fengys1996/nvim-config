vim.lsp.enable({ 'lua', "go", "clangd", "erlang" })

local opt = { noremap = true, silent = true }

local function maplsp(mapbuf, lsp_name)
	-- goto xxx
	mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
	mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
	mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
	mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
	mapbuf('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)

	-- rename
	mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)

	-- code action
	mapbuf('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)

	-- code format
	mapbuf('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format{async = true}<CR>', opt)

	-- signature help
	mapbuf('n', '<leader>ck', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)

	-- diagnostic
	mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
	mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
	mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)

	if lsp_name == "rust-analyzer" then
		mapbuf("n", "gh", "<cmd>RustLsp hover actions<CR>", opt);
		mapbuf("n", "<leader>ru", "<cmd>RustLsp runnables<CR>", opt)
		mapbuf("n", "<leader>re", "<cmd>RustLsp expandMacro<CR>", opt)
		mapbuf("n", "<leader>rr", "<cmd>RustLsp flyCheck<CR>", opt)
		-- flycheck is used frequently, so add another keymap for it
		mapbuf("n", "<leader>j", "<cmd>RustLsp flyCheck<CR>", opt)
		-- Not commonlly used
		-- mapbuf("n", "<leader>rw", "<cmd>RustLsp reloadWorkspace<CR>", opt)
	else
		mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover() <CR>', opt)
	end


	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
end

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local bufnr = ev.buf
		local client_id = ev.data.client_id
		local client = vim.lsp.get_client_by_id(client_id)

		if client == nil then
			return
		end

		local name = client.name

		local function mapbuf(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		maplsp(mapbuf, name)
	end,
})

local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config('*', {
	capabilities = capabilities,
})

