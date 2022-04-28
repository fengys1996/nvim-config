local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("not found telescope")
  return
end

telescope.setup({
  defaults = {
    initial_mode = "insert",
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    find_files = {
      -- optional themes: dropdown, cursor, ivy
      theme = "ivy",
    }
  },
  extensions = {},
})
