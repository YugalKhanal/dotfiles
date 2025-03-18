{ config, lib, pkgs, ... }:
{
  programs.nixvim = {
  enable = true;

    plugins = {
      cmp = {
        enable = true;
        settings = {
          snippet = {
            expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          };
          window = {
            completion = "require('cmp').config.window.bordered()";
            documentation = "require('cmp').config.window.bordered()";
          };
          mapping = {
            "<C-b>" = "require('cmp').mapping.scroll_docs(-4)";
            "<C-f>" = "require('cmp').mapping.scroll_docs(4)";
            "<C-Space>" = "require('cmp').mapping.complete()";
            "<C-e>" = "require('cmp').mapping.abort()";
            "<CR>" = "require('cmp').mapping.confirm({ select = true })";
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
          ];
        };
      };

      luasnip.enable = true; # Snippet engine
      cmp-nvim-lsp.enable = true; # LSP completion source
      cmp-luasnip.enable = true; # Snippet completion source
      friendly-snippets.enable = true; # Predefined snippets
    };

    extraConfigLua = ''
      require("luasnip.loaders.from_vscode").lazy_load()
    '';
  };
}
