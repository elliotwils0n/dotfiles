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

return M
