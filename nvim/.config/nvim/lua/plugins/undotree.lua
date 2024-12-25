return {
  {
    "mbbill/undotree",
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>ut', ':UndotreeToggle<CR>', { noremap = true, silent = true })
    end
  },
}
