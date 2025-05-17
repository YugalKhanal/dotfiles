{
  programs.nixvim = {
    plugins = {
      snacks = {
        enable = true;
        settings = {
          notifier.enabled = false;
        };
      };

      dashboard.enable = true;
    };
  };
}
