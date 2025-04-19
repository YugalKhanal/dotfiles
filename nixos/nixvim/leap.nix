{
  programs.nixvim = {
    plugins.leap = {
      enable = true;
      addDefaultMappings = false;
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
    ];
  };
}
