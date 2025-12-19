return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local dap_widgets = require('dap.ui.widgets')

    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F2>", dap.step_into)
    vim.keymap.set("n", "<F3>", dap.step_over)
    vim.keymap.set("n", "<F4>", dap.step_out)
    vim.keymap.set("n", "<F5>", dap.step_back)
    vim.keymap.set("n", "<F13>", dap.restart)
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end)
    vim.keymap.set("n", "<leader>dr", function()
      dap.repl.open()
    end)
    vim.keymap.set({ "n", "v" }, "<leader>dh", function()
      dap_widgets.hover()
    end)
    vim.keymap.set({ "n", "v" }, "<leader>dp", function()
      dap_widgets.preview()
    end)
    vim.keymap.set("n", "<leader>df", function()
      dap_widgets.centered_float(dap_widgets.frames)
    end)
    vim.keymap.set("n", "<leader>ds", function()
      dap_widgets.centered_float(dap_widgets.scopes)
    end)

    -- adapters
    dap.adapters.codelldb = {
      type = "executable",
      command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
    }
    dap.adapters.delve = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }

    -- configurations
    dap.configurations.c = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.rust = dap.configurations.c
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
  end,
}
