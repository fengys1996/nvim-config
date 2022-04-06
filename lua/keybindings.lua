-- leader key --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- noremap mean no remapping, slient indicates that no redundant information will be output.
local opt = {noremap = true, silent = true }

-- windows split shortcut key --

-- map(mode, key, mapped-key, option)
-- the category of mode
-- n: Normal, i: Insert, v: Visual, t: Terminal, c: Command

-- split to right
map("n", "sk", ":vsp<CR>", opt)
-- split to down
map("n", "sj", ":sp<CR>", opt)
-- shutdown current window
map("n", "sc", "<C-w>c", opt)
-- shutdown other windows
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl : Jump between windows
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- width adjustment of window
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- height adjustment of window
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- equal scaling adjustment of window
map("n", "s=", "<C-w>=", opt)

-- config about terminal
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>rt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- scroll up and down
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- indent code in visual mode
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- move selected text up and down
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

------------------ bufferline --------------------
-- tab switching(left and right)
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- close
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

---------------- Telescope Config ----------------
-- find some files
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- global search
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- nvim-tree --
-- alt + m : open and close tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)

----------------- vim-signify --------------------
map("n", "<leader>gd", ":SignifyDiff<CR>", opt)

-- short cut of plugins
local pluginKeys = {}
-- list if shortcut
-- Telescope shortcut in insert mode on pop list
pluginKeys.telescopeList = {
  i = {
    -- moving up and down
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- history record
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- close search window
    ["<C-c>"] = "close",
    -- preview window moves up and down
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

------------------- TreeList -----------------------
pluginKeys.nvimTreeList = {
  -- open file or floder
{ key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- open file with split
{ key = "v", action = "vsplit" },
{ key = "h", action = "split" },
  -- show hidden files
{ key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- some op of file
{ key = "<F5>", action = "refresh" },
{ key = "a", action = "create" },
{ key = "d", action = "remove" },
{ key = "r", action = "rename" },
{ key = "x", action = "cut" },
{ key = "c", action = "copy" },
{ key = "p", action = "paste" },
{ key = "s", action = "system_open" },
}

-- lsp callback plugin key config
pluginKeys.maplsp = function(mapbuf)
  -- rename
  mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  -- code action
  mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  -- go xx
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- diagnostic
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- leader + =
  mapbuf('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

pluginKeys.cmp = function(cmp)
  return {
    -- prev item
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- next item
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- popup complete
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- cancel complete
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- confirm
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
end

return pluginKeys

