{ pkgs, ... }:
{
  stylix = {
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/base16-vim.yaml";
    base16Scheme = {
      base00 = "#181818"; # Background
      base01 = "#282828";
      base02 = "#383838";
      base03 = "#585858";
      base04 = "#b8b8b8";
      base05 = "#d8d8d8"; # Default Text
      base06 = "#e8e8e8";
      base07 = "#f8f8f8";
      base08 = "#ab4642"; # Red
      base09 = "#dc9656"; # Orange
      base0A = "#f7ca88"; # Yellow
      base0B = "#a1b56c"; # Green
      base0C = "#86c1b9"; # Cyan
      base0D = "#7cafc2"; # Blue
      base0E = "#ba8baf"; # Purple
      base0F = "#a16946"; # Brown
    };
    image = ./1363709.png;
    cursor = {
      name = "Banana cursor";
      package = pkgs.banana-cursor;
      size = 50;
    };
    fonts = {
      sizes = {
        applications = 13;
        desktop = 13;
        popups = 8;
        terminal = 12;
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
    polarity = "dark";
    targets = {
      tmux.enable = true;
      nixvim.enable = true;
      ghostty.enable = true;
      waybar.enable = true;
      zathura.enable = true;
      vesktop.enable = true;
      fzf.enable = true;
      gtk.enable = true;
      hyprland.enable = true;
      rofi.enable = true;
      swaync.enable = true;
      vim.enable = true;
      btop.enable = true;
      lazygit.enable = true;
      mpv.enable = true;
    };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Banana";
      package = pkgs.banana-cursor;
      size = 50;
    };
  };
}
