{
  programs.nixvim = {
    config = {
      plugins.bufferline = {
        enable = true;
      };

      keymaps = [
        { mode = "n"; key = "<Tab>"; action = "<Cmd>BufferLineCycleNext<CR>"; options.desc = "Next buffer"; }
        { mode = "n"; key = "<S-Tab>"; action = "<Cmd>BufferLineCyclePrev<CR>"; options.desc = "Previous buffer"; }
        { mode = "n"; key = "<leader>x"; action = "<Cmd>bdelete<CR>"; options.desc = "Close buffer"; }
      ];
    };
  };
}
