local opts = {
	noremap = true,
	silent = true,
}

vim.g.mapleader = " "
local k = vim.keymap.set

-- efficiency
-- k("n","<leader>e","<cmd>Ex<CR>",opts)
k("i", "jk", "<ESC>", opts)
k("n", "<leader>s", "<cmd>w<CR>", opts)
k("n", "<leader>z", "<cmd>so %<CR>", opts)
k("n", "<leader>q", "<cmd>q!<CR>", opts)
k("n", "<leader>x", "<cmd>wq<CR>", opts)

k("n", "<left>", '<cmd>echo "use h to move bru"<CR>')
k("n", "<right>", '<cmd>echo "use l to move bru"<CR>')
k("n", "<down>", '<cmd>echo "use j to move bru"<CR>')
k("n", "<up>", '<cmd>echo "use k to move bru"<CR>')

-- windows
k("n", "<leader>v", "<C-w>v", opts)
k("n", "<leader>h", "<C-w>s", opts)
k("n", "<leader>=", "<C-w>=", opts)
k("n", "<leader>c", "<cmd>close<CR>", opts)

-- window resize
k("n", "<C-Up>", ":resize -2<CR>", opts)
k("n", "<C-Down>", ":resize +2<CR>", opts)
k("n", "<C-Left>", ":vertical resize -2<CR>", opts)
k("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- navigation
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

-- visual mode
k("v", "<", "<gv", opts)
k("v", ">", ">gv", opts)
