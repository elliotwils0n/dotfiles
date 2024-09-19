return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-context" },
  config = function()
    local grammars = {
      "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
    }
    vim.list_extend(grammars, require("plugins.tweaks.lang").grammars)

    require("nvim-treesitter.configs").setup({
      ensure_installed = grammars,
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
