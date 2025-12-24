-- Some configurations for Neovim setup

local m = {}

m.language_server_bin_path = "/home/fys/.local/share/nvim/mason/"
m.nvim_rs_path = "/home/fys/.config/nvim-rs"
m.rustaceanvim_prefer_workspace_roots = {
    "/home/fys/source/greptimedb-enterprise/",
    "/home/fys/projects/greptimedb-enterprise/",
    "/home/fys/projects/greptimedb/",
    "/home/fys/projects/ent/",
}
m.rust_analyzer_path_backup = "/home/fys/soft/rust-analyzer/ra-25-08-25"

return m
