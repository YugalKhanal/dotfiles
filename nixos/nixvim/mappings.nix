{
  programs.nixvim = {
    config = {
      keymaps = [
        { mode = "i"; key = "<C-h>"; action = "<Left>"; options.desc = "Move left"; }
        { mode = "i"; key = "<C-l>"; action = "<Right>"; options.desc = "Move right"; }
        { mode = "i"; key = "<C-j>"; action = "<Down>"; options.desc = "Move down"; }
        { mode = "i"; key = "<C-k>"; action = "<Up>"; options.desc = "Move up"; }
        { mode = "n"; key = "<leader>S"; action = ":w<CR>"; options.desc = "Save file"; }
        { mode = "n"; key = "<leader>Q"; action = ":q<CR>"; options.desc = "Quit file"; }
        { mode = "n"; key = "<leader>ih"; action = "<CMD>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>"; options.desc = "Toggle inlay hints"; }
      ];
    };
  };
}
