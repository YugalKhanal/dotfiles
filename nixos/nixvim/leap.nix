{
  programs.nixvim = {
    plugins.leap = {
      enable = true;
    };

    keymaps = [
      {
        mode = [ "n" "x" "o" ];
        key = "s";
        action = "<Plug>(leap-forward)";
      }
      {
        mode = [ "n" "x" "o" ];
        key = "S";
        action = "<Plug>(leap-backward)";
      }
      {
        mode = [ "n" "x" "o" ];
        key = "Gs";
        action = "<Plug>(leap-from-window)";
      }
    ];
  };
}
