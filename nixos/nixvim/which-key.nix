{
  programs.nixvim = {
    config = {
      plugins.which-key = {
        enable = true;
      };
    };
  };
}
