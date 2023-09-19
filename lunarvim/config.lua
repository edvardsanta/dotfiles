-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.builtin.dap.active = true
lvim.format_on_save.enabled = true

-- Plugins
lvim.plugins = require("custom.plugins")
vim.notify = require("notify")
-- mappings
local mappings = require("custom.mappings")
lvim.builtin.which_key.mappings["m"] = mappings.muren
for key, val in pairs(mappings.dap) do
  lvim.keys.normal_mode[key] = val
end

-- dap
require("dap.c_cpp_rust_zig")
require("dap.bash")
require("dap.elixir")
