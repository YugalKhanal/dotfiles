{ config, lib, pkgs, ... }:
{
  programs.nixvim = {
  enable = true;

    plugins = {
      lsp = {
        enable = true;

        servers = {
          tsserver.enable = true;
          lua-ls.enable = true;
          pyright.enable = true;
          nixd.enable = true;
          ruff.enable = true;
          texlab.enable = true;

          gopls = {
            enable = true;
            settings = {
              gopls = {
                buildFlags = [ "-mod=mod" ];
                env = { GOFLAGS = "-mod=mod"; };
                analyses = { unusedparams = true; };
                staticcheck = true;
                usePlaceholders = false;
                completeUnimported = true;
              };
            };
          };

          clangd = {
            enable = true;
            filetypes = [ "c" "cpp" "objc" "objcpp" ];
            cmd = [ "clangd" "--background-index" "--suggest-missing-includes" ];
            rootDir = "vim.loop.cwd()";
          };
        };
      };

      cmp-nvim-lsp.enable = true; # Enables completion capabilities for LSP
    };

    keymaps = [
      { mode = "n"; key = "K"; action = "vim.lsp.buf.hover()"; options.desc = "Show hover information"; }
      { mode = "n"; key = "<leader>gd"; action = "vim.lsp.buf.definition()"; options.desc = "Go to definition"; }
      { mode = "n"; key = "<leader>gr"; action = "vim.lsp.buf.references()"; options.desc = "Find references"; }
      { mode = "n"; key = "<leader>ca"; action = "vim.lsp.buf.code_action()"; options.desc = "Code actions when hovering"; }
    ];
  };
}
