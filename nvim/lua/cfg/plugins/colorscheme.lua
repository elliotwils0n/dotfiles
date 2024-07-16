return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
            style = "night",
            light_style = "day",
            transparent = false,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true, bold = true },
                functions = { bold = true },
                variables = {},
                sidebars = "transparent",
                floats = "transparent",
            },
            day_brightness = 0.2,
            dim_inactive = true,
            lualine_bold = false,
        })
        vim.cmd("colorscheme tokyonight")
    end,
}
