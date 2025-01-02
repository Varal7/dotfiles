-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false -- cancel animations
vim.opt.clipboard = ""       -- dont' default to system clipboard
-- vim.opt.scrolloff = 0        -- don't add extra scrolloff
vim.opt.splitkeep = "cursor" -- keep cursor in same position when splitting
vim.opt.wrap = true          -- Enable line wrap

vim.g.ai_cmp = false         -- disable ai in cmp

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { ".git", "lsp", "lua", "cwd" }
