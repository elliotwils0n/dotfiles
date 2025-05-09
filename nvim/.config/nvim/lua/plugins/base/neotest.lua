return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-python",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rust"),
        require("neotest-go"),
        require("neotest-python"),
      },
    })

    local neotest = require("neotest")

    vim.keymap.set("n", "<leader>tr", function()
      neotest.run.run()
    end)
    vim.keymap.set("n", "<leader>td", function()
      neotest.run.run({ strategy = "dap" })
    end)
    vim.keymap.set("n", "<leader>ta", function()
      neotest.run.run(vim.fn.expand("%"))
    end)
    vim.keymap.set("n", "<leader>ts", function()
      neotest.summary.toggle()
    end)
    vim.keymap.set("n", "<leader>to", function()
      neotest.output_panel.toggle()
    end)
  end,
}
