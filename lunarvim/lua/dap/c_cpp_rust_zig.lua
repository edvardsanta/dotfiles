---@diagnostic disable: redundant-parameter
local dap = require("dap")

-- TODO move these builds to utils
local function build_rust()
  vim.fn.jobstart("cargo build", {
    on_exit = function(_, _)
      print("Cargo build command completed.")
    end,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

local function build_zig()
  vim.fn.jobstart("zig build", {
    on_exit = function(_, _)
      print("Zig build command completed.")
    end,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

local function build_c()

end

local function build_cpp()

end

local function execute_make()

end

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    args = { "--port", "${port}" },
    command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb"
  }
}


local path = vim.fn.getcwd() .. "/.vscode/launch.json"
print(path)
require('dap.ext.vscode').load_launchjs(path, { codelldb = { 'rust' } })

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    preLaunchTask = build_rust(),
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
  },
  {
    name = "Launch file with args",
    type = "codelldb",
    preLaunchTask = build_rust(),
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/', 'file')
    end,
    args = function()
      local arg = vim.fn.input("Args: ")
      local list = require("utils.split").split(arg)
      return list
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
  },
}


dap.configurations.zig = {
  {
    name = "Launch file",
    type = "codelldb",
    preLaunchTask = build_zig(),
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/zig-out', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
  },
  {
    name = "Launch file with args",
    type = "codelldb",
    preLaunchTask = build_zig(),
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/zig-out', 'file')
    end,
    args = function()
      local arg = vim.fn.input("Args: ")
      local list = require("utils.split").split(arg)
      return list
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
  },
}
