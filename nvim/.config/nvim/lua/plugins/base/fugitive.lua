return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>sa", "<CMD>diffget //2<CR>")
    vim.keymap.set("n", "<leader>sd", "<CMD>diffget //3<CR>")
  end,
}
