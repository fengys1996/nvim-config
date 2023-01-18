local status_1, mason = pcall(require, "mason")
if not status_1 then
	vim.notify("not found mason")
	return
end

mason.setup()

local status_2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_2 then
	vim.notify("not found mason_lspconfig")
	return
end

mason_lspconfig.setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer", "taplo", "cmake" }
})
