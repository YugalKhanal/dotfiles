{
  programs.nixvim = {
    config = {
      plugins.comment = {
        enable = true;
      };

      keymaps = [
        { mode = "n"; key = "gcc"; action = "Comment.api.toggle.linewise.current()"; options.desc = "Comment toggle current line"; }
        { mode = [ "n" "o" ]; key = "gc"; action = "Comment.api.toggle.linewise.current()"; options.desc = "Comment toggle linewise"; }
        { mode = "x"; key = "gc"; action = "Comment.api.toggle.linewise.current()"; options.desc = "Comment toggle linewise (visual)"; }
        { mode = "n"; key = "gbc"; action = "Comment.api.toggle.blockwise.current()"; options.desc = "Comment toggle current block"; }
        { mode = [ "n" "o" ]; key = "gb"; action = "Comment.api.toggle.blockwise.current()"; options.desc = "Comment toggle blockwise"; }
        { mode = "x"; key = "gb"; action = "Comment.api.toggle.blockwise.current()"; options.desc = "Comment toggle blockwise (visual)"; }

        { mode = "n"; key = "<leader>/"; action = "Comment.api.toggle.linewise.current()"; options.desc = "Toggle comment"; }
        { mode = "v"; key = "<leader>/"; action = "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"; options.desc = "Toggle comment"; }
      ];
    };
  };
}
