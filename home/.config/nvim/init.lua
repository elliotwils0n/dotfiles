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

vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")

vim.keymap.set("n", "-", "<CMD>Vex!<CR>")

vim.keymap.set("n", "<leader>t", "<CMD>vert term<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

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

vim.opt.completeopt:append("noselect")

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo//"

vim.filetype.add {
  extension = {
    h = "c",
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.colorcolumn = "100"
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- treesitter
local treesitter_group = vim.api.nvim_create_augroup("treesitter-start", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = treesitter_group,
  callback = function(args)
    local ok, parser = pcall(vim.treesitter.get_parser, args.buf)
    if ok and parser then
      pcall(vim.treesitter.start)
    end
  end,
})

-- lsp
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.enable({
  "clangd", "lua_ls", "rust_analyzer", "gopls", "pyright",
})

vim.lsp.config("*", {
  capabilities = lsp_capabilities,
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

-- other
vim.opt.winborder = "rounded"

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
})

-- plugins
local gh = function(x) return "https://github.com/" .. x end
vim.pack.add({
  { src = gh("neovim/nvim-lspconfig") },
  { src = gh("nvim-treesitter/nvim-treesitter"),        version = "main" },
  { src = gh("nvim-treesitter/nvim-treesitter-context") },
  { src = gh("saghen/blink.cmp"),                       version = vim.version.range("1.*") },
  { src = gh("rafamadriz/friendly-snippets") },
  { src = gh("mfussenegger/nvim-dap") },
  { src = gh("elliotwils0n/nvim-dapconfig"), },
  { src = gh("tpope/vim-fugitive") },
  { src = gh("nvim-lua/plenary.nvim") }, -- for telescope
  { src = gh("nvim-telescope/telescope.nvim"),          version = vim.version.range("0.2.*") },
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

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({
  "c", "lua", "rust", "go", "python",
})

require("blink.cmp").setup({})
lsp_capabilities = vim.tbl_deep_extend("force", lsp_capabilities,
  require("blink.cmp").get_lsp_capabilities({}, false))
vim.lsp.config("*", {
  capabilities = lsp_capabilities,
})

local dap, dap_widgets = require("dap"), require("dap.ui.widgets")
vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F13>", dap.restart)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<leader>dr", function()
  dap.repl.toggle()
end)
vim.keymap.set({ "n", "v" }, "<leader>dh", function()
  dap_widgets.hover()
end)
vim.keymap.set({ "n", "v" }, "<leader>dp", function()
  dap_widgets.preview()
end)
vim.keymap.set("n", "<leader>df", function()
  dap_widgets.centered_float(dap_widgets.frames)
end)
vim.keymap.set("n", "<leader>ds", function()
  dap_widgets.centered_float(dap_widgets.scopes)
end)

require("dapconfig").setup()

require("telescope").setup()
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope_builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})
