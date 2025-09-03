return {
  "saghen/blink.cmp",
  version = "1.*",
  build = "cargo build --release",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    require("blink.cmp").setup({
      keymap = {
        preset = "default",
      },
    })
  end,
}
