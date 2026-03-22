local M = {}

function M.setup()
  local dap = require("dap")

  -- DAP Rust
  dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
  }
  dap.configurations.c = {
    {
      name = "Launch",
      type = "gdb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      args = {},
      cwd = "${workspaceFolder}",
      stopAtBeginningOfMainSubprogram = false,
    },
    {
      name = "Select and attach to process",
      type = "gdb",
      request = "attach",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      pid = function()
        local name = vim.fn.input("Executable name (filter): ")
        return require("dap.utils").pick_process({ filter = name })
      end,
      cwd = "${workspaceFolder}",
    },
    {
      name = "Attach to gdbserver :1234",
      type = "gdb",
      request = "attach",
      target = "localhost:1234",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
    },
  }
  dap.configurations.rust = dap.configurations.c

  -- DAP Golang
  dap.adapters.delve = function(callback, config)
    if config.mode == "remote" and config.request == "attach" then
      callback({
        type = "server",
        host = config.host or "127.0.0.1",
        port = config.port or "38697",
      })
    else
      callback({
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
          detached = vim.fn.has("win32") == 0,
        },
      })
    end
  end
  dap.configurations.go = {
    {
      type = "delve",
      name = "Debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "delve",
      name = "Debug test",
      request = "launch",
      mode = "test",
      program = "${file}",
    },
    {
      type = "delve",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    },
  }

  -- DAP Python
  dap.adapters.python = function(cb, config)
    if config.request == "attach" then
      local port = (config.connect or config).port
      local host = (config.connect or config).host or "127.0.0.1"
      cb({
        type = "server",
        port = assert(port, "`connect.port` is required for a python `attach` configuration"),
        host = host,
        options = {
          source_filetype = "python",
        },
      })
    else
      cb({
        type = "executable",
        command = vim.fn.expand("~/.virtualenvs/debugpy/bin/python"),
        args = { "-m", "debugpy.adapter" },
        options = {
          source_filetype = "python",
        },
      })
    end
  end
  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
          return cwd .. "/venv/bin/python"
        elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
          return cwd .. "/.venv/bin/python"
        else
          return "/usr/bin/python"
        end
      end,
    },
  }
end

return M
