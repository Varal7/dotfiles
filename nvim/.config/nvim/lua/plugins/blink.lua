return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        -- ["<C-l>"] = { "select_and_accept" },
        ["<C-n>"] = { 'select_next' },

      },
      completion = {
        keyword = { range = 'full' },
        accept = {
          auto_brackets = {
            enabled = false,
          },
        },

        list = {
          selection = "auto_insert",
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
      sources = {
        -- default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          lsp = {
            score_offset = 1000
          }
        }

      }
    },
  },
}
