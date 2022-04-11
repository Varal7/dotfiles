require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {"tex", "latex"},

  },
}
-- TODO use treesitter math zone: https://github.com/nvim-treesitter/nvim-treesitter/issues/1184
