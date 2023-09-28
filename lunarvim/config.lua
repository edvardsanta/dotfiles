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
require('dap-go').setup()


-- formatters && linters && code action
require("custom.linters")
require("custom.formatters")


-- colorizer
require 'custom.colorizer'


--tailwind
lvim.builtin.cmp.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}
