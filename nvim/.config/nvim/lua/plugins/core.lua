return {
  -- add embark
  { "embark-theme/vim", name = "embark" },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      integrations = { blink_cmp = true },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    }
  },

  {
    "ibhagwan/fzf-lua",
    keys = {
      -- disable the keymap to grep files
      { "<leader>/", false },
      -- remap some keymaps i like
      { "<C-b>",     "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      { "<C-p>",     "<cmd>FzfLua git_files sort_lastused=true<cr>",             desc = "Find Files (git-files)" },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root(), reveal = true })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd(), reveal = true })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    opts = {
      window = {
        mappings = {
          ["z"] = false,
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },

  {
    "MagicDuck/grug-far.nvim",
    cmd = "RugFar",
  },

  {
    "lewis6991/gitsigns.nvim", enabled = false
  },

  {
    "tpope/vim-fugitive", enabled = true
  },

  {
    "echasnovski/mini.diff", enabled = true
  },

  {
    "edkolev/tmuxline.vim"
  }

}
