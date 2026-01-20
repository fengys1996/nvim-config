-- Do not auto-start LSP servers on buffer open.
-- Use `:LspStart` to start and `:LspStop` to stop LSP servers manually.

local opt = { noremap = true, silent = true }

local copilot_name = "github copilot"
local rust_analyzer_name = "rust-analyzer"

local is_copilot = function(lsp_name)
    return lsp_name:lower() == copilot_name:lower()
end

local is_rust_analyzer = function(lsp_name)
    return lsp_name:lower() == rust_analyzer_name:lower()
end

local function maplsp(bufnr, lsp_name)
    if is_copilot(lsp_name) then
        return
    end

    local opts = {
        buffer = bufnr,
        silent = true,
    }

    -- goto some
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rt', vim.lsp.buf.type_definition, opts)
    -- rename
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    -- code action
    vim.keymap.set('n', '<leader>ra', vim.lsp.buf.code_action, opts)
    -- code format
    vim.keymap.set('n', '<leader>rf', function()
        vim.lsp.buf.format({ async = true })
    end, opts)
    -- signature help
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'go', vim.diagnostic.open_float, opts)
    if is_rust_analyzer(lsp_name) then
        -- the special rust-analyzer keymaps
        vim.keymap.set('n', 'gh', '<cmd>RustLsp hover actions<CR>', opts)
        vim.keymap.set('n', '<leader>ru', '<cmd>RustLsp runnables<CR>', opts)
        vim.keymap.set('n', '<leader>re', '<cmd>RustLsp expandMacro<CR>', opts)
        vim.keymap.set('n', '<leader>rr', '<cmd>RustLsp flyCheck<CR>', opts)
        -- not used now!
        -- vim.keymap.set('n', '<leader>rw', '<cmd>RustLsp reloadWorkspace<CR>', opts)
    else
        vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
    end
    -- not used now!
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
end

-- Setup some when LSP attaches to a buffer.
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client == nil then
            return
        end
        maplsp(ev.buf, client.name)
        -- Disable semantic tokens for all LSP clients to avoid performance issues.
        -- We use nvim-treesitter for syntax highlighting instead.
        -- client.server_capabilities.semanticTokensProvider = nil
    end,
})

-- Create a user command to enable lsp.
vim.api.nvim_create_user_command("LspStart", function()
    -- since use rustaceanvim for rust, so handle it separately.
    if vim.bo.filetype == "rust" then
        require('rustaceanvim.lsp').start()
        require('plugins.lsp.rust').enable_auto_attach()
        return
    end
    vim.lsp.enable({ 'lua', "go", "clangd", "erlang" })
end, {})


-- Create a user command to disable lsp.
vim.api.nvim_create_user_command("LspStop", function()
    -- since use rustaceanvim for rust, so handle it separately.
    if vim.bo.filetype == "rust" then
        require('rustaceanvim.lsp').stop()
        require('plugins.lsp.rust').disable_auto_attach()
        return
    end
    for _, client in ipairs(vim.lsp.get_clients()) do
        client:stop()
    end
end, {})

local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config('*', { capabilities = capabilities })
