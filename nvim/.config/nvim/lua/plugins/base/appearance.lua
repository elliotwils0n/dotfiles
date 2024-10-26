return {
  {
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
        dim_inactive = true,
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          section_separators = "",
          component_separators = "|",
        },
      })
    end,
  },
}
