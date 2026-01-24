local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- Convert a rust-analyzer runnable payload into a shell command string.
local function runnable_to_command(runnable)
    if not runnable or not runnable.args then
        return nil
    end

    local args = runnable.args
    local cmd = { "cargo" }

    vim.list_extend(cmd, args.cargoArgs or {})
    vim.list_extend(cmd, args.cargoExtraArgs or {})

    if args.executableArgs and #args.executableArgs > 0 then
        table.insert(cmd, "--")
        vim.list_extend(cmd, args.executableArgs)
    end

    return table.concat(cmd, " ")
end

local function open_runnables_picker(opts, runnables)
    opts = opts or {}

    local finder = finders.new_table({
        results = runnables,
        entry_maker = function(item)
            return {
                value = item,
                ordinal = item.label or "",
                display = item.label or "[no label]",
            }
        end,
    })

    pickers.new(opts, {
        prompt_title = opts.prompt_title or "Rust Runnables",
        finder = finder,
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if not selection or not selection.value then
                    return
                end

                local command = runnable_to_command(selection.value)
                if not command then
                    vim.notify("Failed to build runnable command", vim.log.levels.ERROR)
                    return
                end

                vim.fn.setreg("+", command)
                vim.notify("Copied runnable to clipboard: " .. command)
            end)

            return true
        end,
    }):find()
end

local function fetch_runnables(opts)
    local bufnr = vim.api.nvim_get_current_buf()

    local clients = vim.lsp.get_clients({
        bufnr = bufnr,
        name = "rust-analyzer",
    })

    if #clients == 0 then
        vim.notify("No rust-analyzer client attached", vim.log.levels.WARN)
        return
    end

    local client = clients[1]
    -- Request all runnables in the buffer (position omitted so RA returns the full set).
    local params = {
        textDocument = vim.lsp.util.make_text_document_params(bufnr),
    }
    local cursor_line = vim.api.nvim_win_get_cursor(0)[1] - 1

    client:request(
        "experimental/runnables",
        params,
        function(err, result)
            if err then
                vim.notify("runnables error: " .. err.message, vim.log.levels.ERROR)
                return
            end

            if not result or vim.tbl_isempty(result) then
                vim.notify("No runnables found")
                return
            end

            local filtered = result
            if opts and opts.current_line_only then
                filtered = {}
                for _, runnable in ipairs(result) do
                    local target = (runnable.location and runnable.location.targetRange) or runnable.range
                    if target and target.start and target["end"] then
                        local start_line = target.start.line
                        local end_line = target["end"].line
                        if cursor_line >= start_line and cursor_line <= end_line then
                            table.insert(filtered, runnable)
                        end
                    end
                end

                if #filtered == 0 then
                    vim.notify("No runnables found on current line")
                    return
                end
            end

            -- Ensure picker opens in main event loop.
            vim.schedule(function()
                open_runnables_picker(opts, filtered)
            end)
        end,
        bufnr
    )
end

return require("telescope").register_extension({
    exports = {
        runnables = fetch_runnables,
        -- default entry when invoking `:Telescope rust_runnables`
        rust_runnables = fetch_runnables,
        runnables_line = function(opts)
            opts = opts or {}
            opts.current_line_only = true
            opts.prompt_title = opts.prompt_title or "Rust Runnables (Line)"
            fetch_runnables(opts)
        end,
    },
})
