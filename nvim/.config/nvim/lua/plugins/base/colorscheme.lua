return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "normal",
          floats = "transparent",
        },
      })
      vim.cmd.colorscheme "tokyonight"
    end,
  },
  {
    "catppuccin/nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    name = "catpuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        default_integrations = true,
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
