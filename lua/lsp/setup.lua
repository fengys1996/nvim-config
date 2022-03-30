local lsp_installer = require("nvim-lsp-installer")

------------------ language server list -----------------------
local servers = {
  sumneko_lua = require("lsp.config.lua"),
  rust_analyzer = require("lsp.config.rust"),
}

------------------ install language server ---------------------
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end


------------------ language server config ---------------------
lsp_installer.on_server_ready(function (server)
  local config = servers[server.name]
  if config == nil then
    return
  end
  if config.on_setup then
    config.on_setup(server)
  else
    server:setup({})
  end
end)
