return {
  "mfussenegger/nvim-dap",
  dependencies = {},
  config = function()
    local dap = require("dap")
    local widgets = require("dap.ui.widgets")

    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end)
    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F2>", dap.step_into)
    vim.keymap.set("n", "<F3>", dap.step_over)
    vim.keymap.set("n", "<F4>", dap.step_out)
    vim.keymap.set("n", "<F5>", dap.step_back)
    vim.keymap.set("n", "<F12>", dap.restart)

    vim.keymap.set("n", "<leader>dr", function()
      dap.repl.open()
    end)
    vim.keymap.set({ "n", "v" }, "<leader>dh", function()
      widgets.hover()
    end)
    vim.keymap.set({ "n", "v" }, "<leader>dp", function()
      widgets.preview()
    end)
    vim.keymap.set("n", "<leader>df", function()
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set("n", "<leader>ds", function()
      widgets.centered_float(widgets.scopes)
    end)

    require("plugins.tweaks.debug").setup()
  end,
}
