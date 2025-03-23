{
  programs = {
    fastfetch = {
      enable = true;
      settings = builtins.fromJSON (builtins.readFile ./fastfetch.jsonc);
    };
  };
}
