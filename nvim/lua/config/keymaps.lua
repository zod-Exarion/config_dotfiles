-- Keymaps are automatically loaded on t<C->e VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "Escape Insert Mode jk" })

map("n", "<leader>+", "<C-a>", { desc = "Arithmetic increment" })
map("n", "<leader>-", "<C-x>", { desc = "Arithmetic decrement" })
