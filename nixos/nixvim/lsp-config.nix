{
  programs.nixvim = {
    config = {
      plugins = {
        lsp = {
          enable = true;
          inlayHints = true;
          servers = {
            ts_ls.enable = true;
            lua_ls.enable = true;
            pyright.enable = true;
            nixd.enable = true;
            gopls = {
              enable = true;
              settings = {
                gopls = {
                  buildFlags = [ "-mod=mod" ];
                  env = { GOFLAGS = "-mod=mod"; };
                  analyses.unusedparams = true;
                  staticcheck = true;
                  usePlaceholders = false;
                  completeUnimported = true;
                  hints = {
                    # compositeLiteralFields = true;
                    # compositeLiteralTypes = true;
                    # constantValues = true;
                    functionTypeParameters = true;
                    parameterNames = true;
                    # rangeVariableTypes = true;
                  };
                };
              };
            };
            clangd = {
              enable = true;
              filetypes = [ "c" "cpp" "objc" "objcpp" ];
              cmd = [ "clangd" "--background-index" "--suggest-missing-includes" ];
            };
            ruff.enable = true;
            texlab.enable = true;
          };

          # LSP-related keymaps
          keymaps = {
            lspBuf = {
              gd = {
                action = "definition";
                desc = "Goto Definition";
              };
              gr = {
                action = "references";
                desc = "Goto References";
              };
              K = {
                action = "hover";
                desc = "Show hover information";
              };
              ca = {
                action = "code_action";
                desc = "Code actions when hovering";
              };
              gts = {
                action = "type_definition";
                desc = "Goto type definition";
              };
              "<leader>cr" = {
                action = "rename";
                desc = "Rename symbol under cursor";
              };
            };
            diagnostic = {
              "[d" = {
                action = "goto_next";
                desc = "Goto next diagnostic";
              };
              "]d" = {
                action = "goto_prev";
                desc = "Goto previous diagnostic";
              };
            };
          };
        };
      };
    };
  };
}
