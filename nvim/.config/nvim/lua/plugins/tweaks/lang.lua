local M = {}

M.grammars = {
  "rust", "go", "python",
}

M.linters = {
  rust = { "clippy" },
  go = { "golangcilint" },
  python = { "pylint" },
}

M.servers = {
  "clangd", "lua_ls",
  "rust_analyzer", "gopls", "pyright",
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
end

return M
