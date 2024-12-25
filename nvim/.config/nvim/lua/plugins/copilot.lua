return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      copilot_node_command = '/Users/varal7/.nvm/versions/node/v20.2.0/bin/node',
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  }
}
