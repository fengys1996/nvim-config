local status, bufferline = pcall(require, "bufferline")
if not status then
  vim.notify("not found bufferline plugin")
  return
end

---------------- The Config of bufferline --------------------
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
  options = {
    mode = "buffers",
    -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    -- sidebar config
    offsets = {
    {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    diagnostics = "nvim_lsp",
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        -- return vim.fn.fnamemodify(buf.name, ':t:r')
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    -- 可选，显示 LSP 报错图标
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
    show_buffer_default_icon = true,
    show_close_icon = true,
    separator_style = "slant",
    diagnostics_update_in_insert = false,
    numbers = "ordinal"
  },
})
