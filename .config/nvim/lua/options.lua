vim.cmd("let g:netrw_liststyle = 3")

local o = vim.opt

-- basic 
o.clipboard = 'unnamedplus'
o.completeopt = {'menu','menuone','noselect'}
o.mouse = 'a'

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
