return {
  "lervag/vimtex",
  event = "BufRead *.tex",
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      command = "setlocal spell spelllang=en",
    })
    vim.g.vimtex_view_method = "zathura"
    vim.cmd([[set conceallevel=2]])
    vim.cmd([[let g:tex_conceal='abdmg']])
    -- vim.g.vimtex_quickfix_ignore_filters = { "Overfull \\hbox" }
  end,
}
