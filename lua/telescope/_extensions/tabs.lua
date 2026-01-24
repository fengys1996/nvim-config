local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local entry_display = require("telescope.pickers.entry_display")

local defaults = {
    select_mappings = { "<CR>", "<C-y>" },
    max_buffers = 3,
}

local function format_tab_entry(tab, max_buffers, current_tab)
    local tabnr = vim.api.nvim_tabpage_get_number(tab)
    local wins = vim.api.nvim_tabpage_list_wins(tab)

    local seen = {}
    local buffers = {}

    for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        if not seen[buf] then
            seen[buf] = true

            local name = vim.api.nvim_buf_get_name(buf)
            local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf })
            local buftype = vim.api.nvim_get_option_value("buftype", { buf = buf })

            local label
            if name ~= "" and buftype == "" then
                label = vim.fn.fnamemodify(name, ":t")
            elseif filetype ~= "" then
                label = "[" .. filetype .. "]"
            elseif buftype ~= "" then
                label = "[" .. buftype .. "]"
            elseif name ~= "" then
                label = vim.fn.fnamemodify(name, ":t")
            end

            table.insert(buffers, label)
        end
    end

    local display_buffers = buffers
    if max_buffers and max_buffers > 0 and #buffers > max_buffers then
        display_buffers = {}
        for i = 1, max_buffers do
            display_buffers[i] = buffers[i]
        end
        local extra = #buffers - max_buffers
        table.insert(display_buffers, string.format("...(+%d)", extra))
    end

    local entry_label = "Tab " .. tabnr
    if #display_buffers > 0 then
        entry_label = entry_label .. " → " .. table.concat(display_buffers, "; ")
    end

    local is_current = tab == current_tab
    local displayer = entry_display.create({
        separator = " ",
        items = {
            { width = 1 },
            { remaining = true },
        },
    })

    return {
        value = tab,
        ordinal = tostring(tabnr) .. " " .. table.concat(buffers, " "),
        display = function()
            local marker = is_current and "●" or " "
            local marker_hl = is_current and "TelescopeResultsNumber" or nil
            return displayer({
                { marker, marker_hl },
                { entry_label },
            })
        end,
    }
end

local function build_finder(tabs, max_buffers, current_tab)
    return finders.new_table({
        results = tabs or vim.api.nvim_list_tabpages(),
        entry_maker = function(tab)
            return format_tab_entry(tab, max_buffers or defaults.max_buffers, current_tab)
        end,
    })
end

local function curr_tab_idx(tabs)
    local current_tab = vim.api.nvim_get_current_tabpage()
    local select_idx
    for idx, tab in ipairs(tabs) do
        if tab == current_tab then
            select_idx = idx
            break
        end
    end
    return select_idx
end

local function clamp_default_index(tabs, index)
    if not index or index < 1 then
        return 1
    end
    if index > #tabs then
        return #tabs
    end
    return index
end

local function wrap_index(tabs, index)
    local count = #tabs
    if count == 0 then
        return index
    end
    if index < 1 then
        return count
    end
    if index > count then
        return 1
    end
    return index
end

local function tabs_picker(opts)
    opts = opts or {}

    local tabs = vim.api.nvim_list_tabpages()
    local select_index = opts.default_selection_index or curr_tab_idx(tabs)
    select_index = clamp_default_index(tabs, select_index)
    local current_tab = vim.api.nvim_get_current_tabpage()
    local finder = build_finder(tabs, opts.max_buffers, current_tab)

    pickers.new(opts, {
        prompt_title = "Tabs",
        finder = finder,
        default_selection_index = select_index,
        sorter = conf.generic_sorter(opts),
        default_text = opts.default_text,
        initial_mode = opts.initial_mode or "normal",
        attach_mappings = function(prompt_bufnr, map)
            local select_keys = opts.select_mappings or defaults.select_mappings

            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.api.nvim_set_current_tabpage(selection.value)
            end)

            for _, key in ipairs(select_keys) do
                map("i", key, actions.select_default)
                map("n", key, actions.select_default)
            end

            return true
        end,
    }):find()
end

local function tabs_picker_next(opts)
    opts = opts or {}
    local tabs = vim.api.nvim_list_tabpages()
    local idx = curr_tab_idx(tabs) or 1
    local target = wrap_index(tabs, idx + 1)
    opts.default_selection_index = target
    tabs_picker(opts)
end

local function tabs_picker_prev(opts)
    opts = opts or {}
    local tabs = vim.api.nvim_list_tabpages()
    local idx = curr_tab_idx(tabs) or 1
    local target = wrap_index(tabs, idx - 1)
    opts.default_selection_index = target
    tabs_picker(opts)
end

return require("telescope").register_extension({
    exports = {
        tabs = tabs_picker,
        tabs_next = tabs_picker_next,
        tabs_prev = tabs_picker_prev,
    },
})
