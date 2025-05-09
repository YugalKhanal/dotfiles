vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set relativenumber")
vim.opt.termguicolors = true
vim.cmd("set autoindent")
vim.opt.scrolloff = 20
vim.cmd("set encoding=UTF-8")
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')
vim.lsp.inlay_hint.enable()
