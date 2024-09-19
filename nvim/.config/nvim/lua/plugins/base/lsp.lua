return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    if pcall(require, "cmp_nvim_lsp") then
      capabilities = vim.tbl_deep_extend(
        "force", capabilities, require("cmp_nvim_lsp").default_capabilities())
    end

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = require("plugins.tweaks.lang").servers,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format { async = true }
        end, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>h", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, opts)
      end,
    })

    require("plugins.tweaks.lang").setup_lsp({ capabilities = capabilities })
  end,
}
