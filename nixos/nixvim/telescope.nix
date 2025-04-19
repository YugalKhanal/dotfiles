{
  programs.nixvim = {
    config = {
      plugins = {
        telescope = {
          enable = true;
          extensions = {
            ui-select = {
              enable = true;
              settings = {
                theme = "dropdown";
              };
            };
          };
          settings = {
            pickers = {
              find_files = {
                hidden = true;
              };
            };
          };
        };
        web-devicons = {
          enable = true;
        };
      };

      keymaps = [
        { mode = "n"; key = "<leader>sf"; action = "<CMD>Telescope find_files<CR>"; options.desc = "Search files project wide"; }
        { mode = "n"; key = "<leader>sw"; action = "<CMD>Telescope live_grep<CR>"; options.desc = "Live grep project wide"; }
        { mode = "n"; key = "<leader>th"; action = "<CMD>Telescope colorscheme<CR>"; options.desc = "Change theme"; }
        { mode = "n"; key = "<leader>sb"; action = "<CMD>Telescope buffers<CR>"; options.desc = "List buffers"; }
        { mode = "n"; key = "<leader>sgc"; action = "<CMD>Telescope git_commits<CR>"; options.desc = "Git commits"; }
        { mode = "n"; key = "<leader>sgb"; action = "<CMD>Telescope git_branches<CR>"; options.desc = "Git branches"; }
        { mode = "n"; key = "<leader>sds"; action = "<CMD>Telescope lsp_document_symbols<CR>"; options.desc = "List document symbols"; }
        { mode = "n"; key = "<leader>sh"; action = "<CMD>Telescope help_tags<CR>"; options.desc = "Search help tags"; }
        { mode = "n"; key = "<leader>so"; action = "<CMD>Telescope oldfiles<CR>"; options.desc = "Search recently opened files"; }
        { mode = "n"; key = "<leader>sm"; action = "<CMD>Telescope man_pages<CR>"; options.desc = "Search man pages"; }
        { mode = "n"; key = "<leader>sk"; action = "<CMD>Telescope keymaps<CR>"; options.desc = "Search keymaps"; }
        { mode = "n"; key = "<leader>sc"; action = "<CMD>Telescope commands<CR>"; options.desc = "Search commands"; }
        { mode = "n"; key = "<leader>sq"; action = "<CMD>Telescope quickfix<CR>"; options.desc = "Search quickfix list"; }
        { mode = "n"; key = "<leader>sl"; action = "<CMD>Telescope loclist<CR>"; options.desc = "Search location list"; }
      ];
    };
  };
}
