{
  programs.nixvim = {
    plugins.cord = {
      enable = true;
      autoLoad = true;
      settings = {
        display = {
          theme = "catppuccin";
          show_time = true;
        };
        editor = {
          tooltip = "Did you mean emacs?";
        };
        ide = {
          enable = true;
          show_status = true;
          text = "Idle";
          timeout = 30000;
        };
        text = {
          file_browser = "Browsing files in {name}";
          workspace = "";
        };
        usercmd = false;
      };
    };
  };
}
