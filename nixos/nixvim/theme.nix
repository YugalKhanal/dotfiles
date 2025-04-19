{ config, lib, ... }:

{
  programs.nixvim = {
    config = {
      colorschemes.gruvbox = { enable = true; };
      plugins = {
        lualine = {
          enable = true;
          settings = {
            theme = lib.mkDefault (config.stylix.base16.name or "gruvbox");
          };
        };
      };

      colorscheme = lib.mkDefault (config.stylix.base16.name or "gruvbox");

      highlight = {
        Normal = { fg = config.stylix.base16.colors.base05 or "#ebdbb2"; bg = config.stylix.base16.colors.base00 or "#282828"; };
        Comment = { fg = config.stylix.base16.colors.base03 or "#928374"; };
        Constant = { fg = config.stylix.base16.colors.base09 or "#fabd2f"; };
        Identifier = { fg = config.stylix.base16.colors.base08 or "#fb4934"; };
        Statement = { fg = config.stylix.base16.colors.base0E or "#d3869b"; };
        PreProc = { fg = config.stylix.base16.colors.base0A or "#fe8019"; };
        Type = { fg = config.stylix.base16.colors.base0D or "#83a598"; };
        Special = { fg = config.stylix.base16.colors.base0C or "#8ec07c"; };

        Cursor = { fg = "#000000"; bg = "#ffcc00"; };
        CursorInsert = { fg = "#000000"; bg = "#00ff00"; };
      };
      opts = {
        termguicolors = true;

        guicursor = "n-v-c:block-Cursor,i-ci:ver25-CursorInsert,r-cr:hor20";
      };

    };
  };
}
