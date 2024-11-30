return {
  "cappyzawa/trim.nvim",
  event = "VeryLazy",
  opts = {
    ft_blocklist = { "markdown" },
  },
  vim.keymap.set('n', '<leader>ft', ':Trim<CR>', {desc = "Trim white spaces"})

}
