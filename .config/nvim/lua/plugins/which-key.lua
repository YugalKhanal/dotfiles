return {
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    config = function(_, opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 350
      local wk = require('which-key')
      wk.setup(opts)
      wk.register({
        ['f'] = { name = "Format" },
        ['s'] = {name = "Search"},
        ['c'] = { name = "Code action"}
      }, { prefix = "<leader>" })
    end,
  },
}
