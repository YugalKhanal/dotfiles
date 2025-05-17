{
  programs.nixvim = {
    config = {
      plugins = {
        lsp-lines.enable = true;
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
                    functionTypeParameters = true;
                    parameterNames = true;
                  };
                };
              };
            };
            clangd = {
              enable = true;
              filetypes = [ "c" "cpp" "objc" "objcpp" ];
              cmd = [
                "clangd"
                "--background-index"
                "--suggest-missing-includes"
              ];
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
              "<leader>rn" = {
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
      extraConfigLua = ''
        require("lsp_lines").setup()

        vim.diagnostic.config({
          virtual_text = {
            prefix = "●",
          },
          virtual_lines = {
            only_current_line = true,
          },
          signs = true,
          underline = true,
          update_in_insert = false,
          float = {
            border = "rounded",
          },
        })
      '';
    };
  };
}
