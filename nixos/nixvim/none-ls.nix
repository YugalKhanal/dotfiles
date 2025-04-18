{
  programs.nixvim = {
    config = {
      plugins.none-ls = {
        enable = true;

        sources = {
          formatting = {
            nixpkgs_fmt.enable = true;
            prettierd = {
              enable = true;
              disableTsServerFormatter = true;
            };
            stylua.enable = true;
            clang_format.enable = true;
            # latexindent.enable = true;
            gofmt.enable = true;
            black.enable = true;
          };
        };

        settings = {
          on_attach = ''
            function(client, bufnr)
              if client.supports_method("textDocument/formatting") then
                local augroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })
                vim.api.nvim_create_autocmd("BufWritePre", {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                  end,
                })
              end
            end
          '';
        };
      };

      keymaps = [
        { mode = "n"; key = "<leader>ff"; action = "<CMD>lua vim.lsp.buf.format()<CR>"; options.desc = "Format the code with LSP"; }
      ];
    };
  };
}
