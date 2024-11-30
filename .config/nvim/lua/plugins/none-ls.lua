return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.nixpkgs_fmt,
        null_ls.builtins.formatting.clang_format, -- For C/C++ formatting
        null_ls.builtins.formatting.latexindent,
        null_ls.builtins.formatting.black, -- Python formatter
      },
    })
    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format the code with LSP" })
  end,
}
