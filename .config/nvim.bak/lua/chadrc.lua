local M = {}

M.base46 = {
  -- theme = "default",
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
  tabufline = {},
  transparency = true,
}

M.nvdash = {
  load_on_startup = true,
}

vim.api.nvim_set_keymap('n', '<Tab>', [[<Cmd>lua require('nvchad.tabufline').next()<CR>]],
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', [[<Cmd>lua require('nvchad.tabufline').prev()<CR>]],
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', [[<Cmd>lua require('nvchad.tabufline').close_buffer()<CR>]],
  { noremap = true, silent = true })

return M
