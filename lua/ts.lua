local sysname = vim.loop.os_uname().sysname
local path

if sysname == "FreeBSD" then
    path = "/usr/local/lib/libtree-sitter-rust.so"
elseif sysname == "Linux" then
    path = "/usr/lib/libtree-sitter-rust.so"
elseif sysname == "Darwin" then
    path = "/usr/local/lib/libtree-sitter-rust.dylib"
end

if path and vim.fn.filereadable(path) == 1 then
    vim.treesitter.language.add("rust", { path = path })
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function(args)
        vim.treesitter.start(args.buf, "rust")
    end,
})
