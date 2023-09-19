local M = {}

M.muren = {
  name = "Muren",
  o = { "<cmd> :MurenOpen <cr>", "Muren open" },
  c = { "<cmd> :MurenClose <cr>", "Muren close" },
  t = { "<cmd> :MurenToggle <cr>", "Muren toggle ui" },
  f = { "<cmd> :MurenFresh <cr>", "Muren fresh" },
  u = { "<cmd> :MurenUnique<cr>", "Muren unique" }
}
M.dap = {
  ["<F5>"] = "<cmd>lua require('dap').continue()<cr>",
  ["<F6>"] = "<cmd>lua require'dap'.disconnect()<cr>",
  ["<F10>"] = "<cmd>lua require('dap').step_over()<cr>",
  ["<F11>"] = "<cmd>lua require('dap').step_into()<cr>",
  ["<F12>"] = "<cmd>lua require('dap').step_out()<cr>",
  ["<leader>B"] = "<cmd>lua require('dap').toggle_breakpoint()<cr>",
}

return M
