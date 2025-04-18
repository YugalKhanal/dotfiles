{
  programs.nixvim = {
    config = {
      plugins = {
        cmp = {
          enable = true;
          settings = {
            snippet = {
              expand = "function(args) require('luasnip').lsp_expand(args.body) end";
            };
            window = {
              completion = { border = "rounded"; };
              documentation = { border = "rounded"; };
            };
            mapping = {
              "<C-n>" = "require('cmp').mapping.select_next_item()";
              "<C-p>" = "require('cmp').mapping.select_prev_item()";
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

        luasnip = { enable = true; };
        cmp-nvim-lsp = { enable = true; };
        friendly-snippets = { enable = true; };
      };
    };
  };
}
