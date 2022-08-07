require("inlay-hints").setup({
  -- renderer to use
  -- possible options are dynamic, eol, virtline and custom
  renderer = "inlay-hints/render/eol",
  hints = {
    parameter = {
      show = true,
      highlight = "Comment",
    },
    type = {
      show = true,
      highlight = "Comment",
    },
  },
  only_current_line = false,

  eol = {
    -- whether to align to the extreme right or not
    right_align = false,

    -- padding from the right if right_align is true
    right_align_padding = 7,

    parameter = {
      separator = ", ",
      format = function(hints)
        return string.format(" <- (%s)", hints)
      end,
    },

    type = {
      separator = ", ",
      format = function(hints)
        return string.format(" » (%s)", hints)
      end,
    },
  }
})

local ih = require("inlay-hints")

local server_opts = {
  -- flags = {
  --   debounce_text_changes = 150,
  -- },
  on_attach = function(client, bufnr)
    ih.on_attach(client, bufnr)
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
      tools = {
        on_initialized = function()
          ih.set_all()
        end,
        autoSetHints = false,
      },
      -- The "server" property provided in rust-tools setup function are the
      -- settings rust-tools will provide to lspconfig during init.            --
      -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
      -- with the user's own settings (opts).
      -- server = vim.tbl_deep_extend("force", server:get_default_options(), server_opts),
      server = server_opts,
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
