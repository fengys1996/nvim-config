vim.api.nvim_create_user_command('Proj', 'Telescope projects', {})
vim.api.nvim_create_user_command('Projm', 'edit ~/.local/share/nvim/project_nvim/project_history', {})

local function live_grep_in_path(path)
    local _path = path or vim.fn.input("Dir: ", "", "dir")
    require("telescope.builtin").live_grep({ search_dirs = { _path } })
end

vim.api.nvim_create_user_command('Rgpath', live_grep_in_path, {})

-- Toggle the crates.
local function toggle_crates()
    require('crates').toggle()
end
vim.api.nvim_create_user_command('ToggleCrates', toggle_crates, {})

vim.api.nvim_create_user_command('ToggleInlayHint',
    'lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())', {})

-- Custom lsp start command  `HaloStart`
--
-- Why do we need this?
-- Since there are some language servers that need to be started in a different way.
local function start_lsp()
    if vim.bo.filetype == "rust" then
        require('rustaceanvim.lsp').start()
        require('plugins.lsp.rust').enable_auto_attach()
    else
        vim.cmd("LspStart")
    end
end

vim.api.nvim_create_user_command('HaloStart', start_lsp, {})

-- Custom lsp stop command  `HaloStop`
--
-- Why do we need this?
-- Since there are some language servers that need to be stopped in a different way.
local function stop_lsp()
    if vim.bo.filetype == "rust" then
        require('rustaceanvim.lsp').stop()
        require('plugins.lsp.rust').disable_auto_attach()
    else
        vim.cmd("LspStop")
    end
end

vim.api.nvim_create_user_command('HaloStop', stop_lsp, {})

vim.api.nvim_create_user_command(
    'Browse',
    function(opts)
        vim.fn.system { 'xdg-open', opts.fargs[1] }
    end,
    { nargs = 1 }
)

-- Autocmds

-- Format on save for rust, go
-- vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format{async = true}]]
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format{async = true}]]

local function clear_diagnostic()
    vim.diagnostic.reset()
end

vim.api.nvim_create_user_command("CleanDiagnostic", clear_diagnostic, {})
