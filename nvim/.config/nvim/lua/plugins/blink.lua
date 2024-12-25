return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<C-l>"] = { "select_and_accept" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },

      }
    },
  },
}
