-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

-- make life easier with some aliases
map("i", "jk", "<esc>", { desc = "Normal mode" })
map('t', 'jk', [[<C-\><C-n>]])
map("v", "<C-C>", "<esc>", { desc = "Normal mode" })

-- yank to system clipboard
map({ "n", "x" }, "<leader>y", '"*y', { desc = "Yank to system clipboard" })
map({ "n", "x" }, "<leader>Y", '"*Y')

-- put from system clipboard
map({ "n", "x" }, "<leader>p", '"*p', { desc = "Put from system clipboard" })
map({ "n", "x" }, "<leader>P", '"*P')

-- toggle comment
map("n", "<leader>/", '<cmd>normal gcc<cr>', { desc = "Toggle comment line" })
map("x", "<leader>/", '<cmd>normal gc<cr>', { desc = "Toggle comment" })

-- remove highlight
map("n", "<leader>h", ':noh<CR>', { desc = "Remove (search) highlight" })

-- Map Ctrl+N to open a vertical split
map('n', '<C-N>', ':vsplit<CR>', { silent = true })
-- Map Ctrl+C to close the current window
map('n', '<C-C>', ':close<CR>', { silent = true })

-- Search for visually selected text
map('v', '//', "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")

-- find what's before `=` and copy it
map('n', '<leader>=', [[^"ayt=o<Esc>"ap]], { noremap = true, silent = true })

-- Toggle Diff
function ToggleDiff()
  if vim.wo.diff then
    vim.cmd("diffoff!")
  else
    vim.cmd("windo diffthis")
  end
end

map("n", "<leader>td", ":lua ToggleDiff()<CR>", { noremap = true, silent = true })
