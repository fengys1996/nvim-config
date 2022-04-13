local status, comment = pcall(require, "Comment")
if not status then
  vim.notify("not found comment")
  return
end

comment.setup(require('keybindings').comment)
