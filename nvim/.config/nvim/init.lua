vim.cmd.syntax "enable"
vim.cmd.colorscheme "lunaperche"

vim.g.mapleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 20

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "-", "<CMD>Vex!<CR>")
vim.keymap.set("n", "<C-t>", "<CMD>vert term<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.background = "dark"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.showtabline = 1

vim.opt.foldenable = false
vim.opt.foldmethod = "manual"
vim.opt.foldlevel = 99

vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"

vim.opt.undofile = true
--vim.opt.undodir = "~/.local/state/nvim/undo/"
vim.opt.clipboard:append { "unnamedplus" }

vim.filetype.add {
  extension = {
    h = "c",
  },
}

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "rust",
  callback = function()
    vim.opt_local.colorcolumn = "100"
  end
})
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
  end
})
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end
})
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "java",
  callback = function()
    vim.opt_local.colorcolumn = "100"
  end
})

require("plugins")
