{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    config = {
      plugins.none-ls = {
        enable = true;
        sources = {
          formatting = {
            nixpkgs_fmt.enable = true;
            prettierd.enable = true;
            stylua.enable = true;
            clang_format.enable = true;
            # latexindent.enable = true;
            gofmt.enable = true;
            black.enable = true;
          };
        };
      };

      keymaps = [
        { mode = "n"; key = "<leader>ff"; action = "<CMD>lua vim.lsp.buf.format()<CR>"; options.desc = "Format the code with LSP"; }
      ];
    };
  };
}
