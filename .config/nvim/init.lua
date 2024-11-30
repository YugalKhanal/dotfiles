vim.g.mapleader = " "
vim.g.start_time = vim.loop.hrtime()

-- NVCHAD UI setup
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

-- require("lazy").setup("plugins")
require("vim-options")
require("mappings")
require("lazy").setup("plugins", require "lazy_config")

-- NVCHAD UI setup
for _, v in pairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
