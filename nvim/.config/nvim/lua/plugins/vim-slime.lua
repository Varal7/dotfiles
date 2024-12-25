return {
  {
    "jpalardy/vim-slime",
    config = function()
      -- slime.vim --
      vim.g.slime_no_mappings = 1 -- Disable default mappings
      vim.g.slime_target = "tmux" -- Set target to tmux
      vim.g.slime_default_config = { socket_name = "default", target_pane = "{up-of}" }
      vim.g.slime_dont_ask_default = 1
      vim.g.slime_python_ipython = 1
      vim.g.slime_preserve_curpos = 1

      vim.keymap.del('v', '<C-c><C-c>')
      vim.api.nvim_set_keymap('n', '<leader>v', '<Plug>SlimeConfig', {})
      vim.api.nvim_set_keymap('x', '<CR><CR>', '<Plug>SlimeRegionSend', {})
      vim.api.nvim_set_keymap('n', '<CR><CR>', '<S-v><Plug>SlimeRegionSend', {})
      -- Define a custom function in Lua
      function _G.Cur(pane)
        pane = pane or 0
        vim.b.slime_config = { socket_name = "default", target_pane = ":." .. pane }
        print(vim.b.slime_config.target_pane)
      end

      vim.api.nvim_set_var("@s", [[^"wdt,x:call v:lua.Cur(w) <CR><CR>j]])
    end,
  },
}
