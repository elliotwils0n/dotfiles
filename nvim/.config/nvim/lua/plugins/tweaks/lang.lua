local M = {}

M.grammars = {
  "rust", "go", "python",
  "javascript", "typescript", "jsdoc",
}

M.linters = {
  rust = { "clippy" },
  go = { "golangcilint" },
  python = { "pylint" },
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
}

M.servers = {
  "clangd", "lua_ls",
  "rust_analyzer", "gopls", "pyright",
  "ts_ls",
}

M.setup_lsp = function(config)
  local lspconfig = require("lspconfig")

  lspconfig.lua_ls.setup({
    capabilities = config.capabilities,
    settings = {
      Lua = {
        workspace = {
          library = {
            vim.env.VIMRUNTIME .. "/lua",
          },
        },
      },
    },
  })

  lspconfig.ts_ls.setup({
    capabilities = config.capabilities,
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
    },
  })
end

return M
