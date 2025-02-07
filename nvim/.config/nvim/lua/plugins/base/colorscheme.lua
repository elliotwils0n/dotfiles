return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      cache = true,
      style = "night",
      transparent = true,
      styles = {
        sidebars = "normal",
        floats = "transparent",
      },
      dim_inactive = false,
    })
    vim.cmd("colorscheme tokyonight")
  end,
}
