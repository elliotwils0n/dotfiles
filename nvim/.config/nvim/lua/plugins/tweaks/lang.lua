local M = {}

M.grammars = {
  "rust", "go",
  "python", "typescript", "javascript",
}

M.linters = {
  rust = { "clippy" },
  go = { "golangcilint" },
  python = { "pylint" },
  typescript = { "eslint_d" },
  javascript = { "eslint_d" },
}

M.servers = {
  "clangd", "lua_ls",
  "rust_analyzer", "gopls",
  "pyright", "ts_ls",
}

return M
