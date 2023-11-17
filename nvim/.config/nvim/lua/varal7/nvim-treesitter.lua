require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "dockerfile",
    "json",
    "json5",
    "lua",
    "make",
    "perl",
    "python",
    "regex",
    "tsx",
    "typescript",
    "vim",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
-- TODO use treesitter math zone: https://github.com/nvim-treesitter/nvim-treesitter/issues/1184
