vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)

local status, ufo = pcall(require, "ufo")
if not status then
	vim.notify("not found ufo")
	return
end

ufo.setup({
	provider_selector = function(_, _, _)
		return { 'treesitter', 'indent' }
	end
})
