vim.cmd.syntax "enable"

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
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo//"

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

-- Neovim exclusive
vim.opt.winborder = "rounded"

-- Plugins
local version = vim.version()
if version.major >= 0 and version.minor >= 12 and version.patch >= 0 then
  local gh = function(x) return "https://github.com/" .. x end
  vim.pack.add({
    { src = gh("neovim/nvim-lspconfig") },
    { src = gh("nvim-treesitter/nvim-treesitter"),        version = "master" },
    { src = gh("nvim-treesitter/nvim-treesitter-context") },
    { src = gh("saghen/blink.cmp"),                       version = vim.version.range("1.*") },
    { src = gh("rafamadriz/friendly-snippets") },
    { src = gh("mfussenegger/nvim-lint") },
    { src = gh("williamboman/mason.nvim") },
    { src = gh("nvim-lua/plenary.nvim") }, -- for telescope
    { src = gh("nvim-telescope/telescope.nvim"),          version = vim.version.range("0.2.*") },
    { src = gh("tpope/vim-fugitive") },
    { src = gh("catppuccin/nvim"),                        name = "catppucin" },
  })

  vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(event)
      local name, kind = event.data.spec.name, event.data.kind
      local updated = kind == "install" or kind == "update"
      if updated and name == "nvim-treesitter" then
        vim.cmd("TSUpdate")
      end
      if updated and name == "blink.cmp" then
        vim.system({ "cargo build --release" }, { cwd = event.data.path })
      end
    end
  })
else
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup({
    { "neovim/nvim-lspconfig" },
    { "nvim-treesitter/nvim-treesitter",        branch = "master",                      lazy = false,                               build = ":TSUpdate", },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "saghen/blink.cmp",                       version = "1.*",                        build = "cargo build --release", },
    { "rafamadriz/friendly-snippets" },
    { "mfussenegger/nvim-lint",                 event = { "BufReadPre", "BufNewFile" }, },
    { "williamboman/mason.nvim" },
    { "nvim-telescope/telescope.nvim",          tag = "v0.2.1",                         dependencies = { "nvim-lua/plenary.nvim" }, },
    { "tpope/vim-fugitive", },
    { "catppuccin/nvim",                        lazy = false,                           priority = 1000,                            name = "catppuccin", },
    change_detection = { notify = false },
  })
end

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
    "rust", "go", "python", "typescript", "javascript", "java",
  },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})

require("blink.cmp").setup({})

local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities = vim.tbl_deep_extend('force', lsp_capabilities,
  require('blink.cmp').get_lsp_capabilities({}, false))

vim.lsp.enable({
  "clangd", "lua_ls", "rust_analyzer", "gopls", "pyright", "ts_ls", "jdtls",
})

vim.lsp.config("*", {
  capabilities = lsp_capabilities,
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set("n", "<leader>h", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, opts)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_prev()
    end, opts)
  end,
})

require("lint").linters_by_ft = {
  rust = { "clippy" },
  go = { "golangcilint" },
  python = { "pylint" },
  typescript = { "eslint_d" },
  javascript = { "eslint_d" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

require("mason").setup()

require("telescope").setup()
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope_builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})

-- fugitive
vim.keymap.set("v", "<leader>sa", ":'<,'>diffget //2<CR>")
vim.keymap.set("v", "<leader>sd", ":'<,'>diffget //3<CR>")

require("catppuccin").setup({
  flavour = "auto",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  float = {
    transparent = true,
  },
})
vim.cmd.colorscheme "catppuccin"
