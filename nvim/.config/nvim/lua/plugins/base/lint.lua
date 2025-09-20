return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("lint").linters_by_ft = {
      rust = { "clippy" },
      go = { "golangcilint" },
      python = { "pylint" },
      typescript = { "eslint_d" },
      javascript = { "eslint_d" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
