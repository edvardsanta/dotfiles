local dap = require("dap")
dap.adapters.mix_task = {
  type = 'executable',
  command = vim.fn.stdpath("data") .. '/mason/packages/elixir-ls/debugger.sh',
  args = {}
}
dap.configurations.elixir = {
  {
    type = "mix_task",
    name = "mix test",
    task = 'test',
    taskArgs = { "--trace" },
    request = "launch",
    startApps = true, -- for Phoenix projects
    projectDir = "${workspaceFolder}",
    requireFiles = {
      "test/**/test_helper.exs",
      "test/**/*_test.exs"
    }
  },
  {
    type = "mix_task",
    name = "phx.server",
    request = "launch",
    task = "phx.server",
    projectDir = "${workspaceFolder}"
  },
  {
    type = "mix_task",
    name = "mix (Default task)",
    request = "launch",
    projectDir = "${workspaceFolder}"
  }
}
