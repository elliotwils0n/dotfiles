return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>sa", "<cmd>diffget //2<CR>")
    vim.keymap.set("n", "<leader>sd", "<cmd>diffget //3<CR>")
  end,
}
