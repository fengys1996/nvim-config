--------------------------------------------------
-- noremap=true: indicates that no remapping
-- slient=true: indicates that no redundant
-- information will be output
--------------------------------------------------
local opt = { noremap = true, silent = true }

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

return {
	maplsp = function(mapbuf)
		-- code formatting
		-- if vim.g.nvim7 then
		-- 	mapbuf('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
		-- else
		-- 	mapbuf('n', '<leader>f', '<cmd>lua vim.lsp.buf.format{async = true}<CR>', opt)
		-- end
		-- rename
		mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
		-- code action
		mapbuf('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
		-- go xx
		mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
		mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
		mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
		mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
		mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
		-- diagnostic
		mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
		mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
		mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
		-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
		-- leader + =
		-- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
		-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
		-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
		-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
		-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
	end
}
