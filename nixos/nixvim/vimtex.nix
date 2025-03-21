{
  programs.nixvim = {
    config = {
      plugins.vimtex = {
        enable = true;
        settings = {
          view_method = "zathura";
          tex_conceal = "abdmg";
        };
      };

      autoCmd = [
        {
          event = "FileType";
          pattern = "tex";
          command = "setlocal spell spelllang=en";
        }
      ];

      extraConfigVim = ''
        set conceallevel=2
      '';

      # Uncomment this if you want to ignore specific warnings in quickfix
      # extraConfigLua = ''
      #   vim.g.vimtex_quickfix_ignore_filters = { "Overfull \\hbox" }
      # '';
    };
  };
}
