return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query",
                "rust", "go", "python",
            },
            sync_install = false,
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
