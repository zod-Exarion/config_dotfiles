-- vim.cmd("let g:netrw_liststyle = 3")

local o = vim.opt
local w = vim.keymap.set

-- basic
o.clipboard = "unnamedplus"
o.completeopt = { "menu", "menuone", "noselect" }
o.mouse = "a"
o.termguicolors = true

-- tabs
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true

-- ui
o.number = true
o.relativenumber = true
o.wrap = false
o.cursorline = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.background = "dark"

-- search
o.incsearch = true
o.hlsearch = false
o.ignorecase = true
o.smartcase = true

--qol
o.undofile = true
o.signcolumn = "yes"
o.updatetime = 250
o.timeoutlen = 300 --timeout for whichkey popup and stuff
o.scrolloff = 15
