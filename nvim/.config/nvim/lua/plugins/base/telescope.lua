return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.1",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup()
    local telescope_builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", telescope_builtin.git_files, {})
    vim.keymap.set("n", "<leader>fs", telescope_builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})
  end,
}
