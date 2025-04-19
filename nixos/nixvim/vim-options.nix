{
  programs.nixvim = {
    config = {
      opts = {
        expandtab = true;
        number = true;
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
        clipboard = "unnamedplus";
        relativenumber = true;
        termguicolors = true;
        autoindent = true;
        scrolloff = 20;
        encoding = "utf-8";
      };

      globals.mapleader = " ";

      keymaps = [
        { mode = "n"; key = "d"; action = "\"_d"; }
        { mode = "v"; key = "d"; action = "\"_d"; }
      ];

      extraConfigLua = ''
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local bufnr = args.buf
            if vim.lsp.inlay_hint then
              vim.lsp.inlay_hint.enable(false)
            end
          end
        })
      '';
    };
  };
}
