local M = {}

M.grammars = {
  "rust", "go", "python",
  "javascript", "typescript", "jsdoc",
  "java",
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
  "ts_ls", "jdtls",
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

  local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/bin/jdtls"
  local lombok_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"
  local jdtls_cmd = { jdtls_path, string.format("--jvm-arg=-javaagent:%s", lombok_path) }
  lspconfig.jdtls.setup({
    cmd = jdtls_cmd,
    capabilities = config.capabilities,
  })
end

return M
