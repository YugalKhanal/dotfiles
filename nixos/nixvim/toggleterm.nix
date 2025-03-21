{
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      settings = {
        direction = "float";
      };
    };

    keymaps = [
      {
        mode = [ "n" "t" ];
        key = "<leader>tr";
        action = "<C-\\><C-n>:ToggleTerm direction=horizontal size=10 1<CR>";
        options = {
          desc = "Toggle horizontal terminal";
          noremap = true;
          silent = true;
        };
      }
      {
        mode = [ "n" "t" ];
        key = "<C-v>";
        action = ":ToggleTerm direction=vertical<CR>";
        options.desc = "Toggle vertical terminal";
      }
      {
        mode = [ "n" "t" ];
        key = "<C-i>";
        action = ":ToggleTerm direction=float<CR>";
        options.desc = "Toggle floating terminal";
      }
    ];
  };
}
