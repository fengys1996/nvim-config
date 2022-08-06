local server_opts = {
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    -- disable formatting, and handle by specialized plugin
    -- client.server_capabilities.document_formatting = false
    -- client.server_capabilities.document_range_formatting = false
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- binding key
    require("keybindings").maplsp(buf_set_keymap)
  end,
}

return {
  on_setup = function(server)

    -- Initialize the LSP via rust-tools instead
    require("rust-tools").setup({
      -- The "server" property provided in rust-tools setup function are the
      -- settings rust-tools will provide to lspconfig during init.            --
      -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
      -- with the user's own settings (opts).
      server = vim.tbl_deep_extend("force", server:get_default_options(), server_opts),

      -- dap = {
      --   adapter = require("rust-tools.dap").get_codelldb_adapter(
      --     "/home/simrat39/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/adapter/codelldb",
      --     "/home/simrat39/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/lldb/lib/liblldb.so"
      --   ),
      -- },
    })
    server:attach_buffers()
  end,
}
