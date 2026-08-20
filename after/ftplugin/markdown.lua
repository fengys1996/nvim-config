local max_file_size = 200 * 1024
local max_line_length = 2000

local file_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
local should_disable = file_size < 0 or file_size > max_file_size

if not should_disable then
    for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
        if #line > max_line_length then
            should_disable = true
            break
        end
    end
end

if should_disable then
    vim.treesitter.stop()
else
    vim.treesitter.start()
end
