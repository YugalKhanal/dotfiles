{
  programs.nixvim = {
    config = {
      plugins = {
        luasnip = { enable = true; };
        cmp-nvim-lsp = { enable = true; };
        cmp-buffer = { enable = true; };
        cmp-path = { enable = true; };
        cmp-cmdline = { enable = true; };
        cmp_luasnip = { enable = true; };
        friendly-snippets = { enable = true; };

        cmp = {
          enable = true;
          autoEnableSources = true;

          settings = {
            snippet = {
              expand = "function(args) require('luasnip').lsp_expand(args.body) end";
            };

            experimental.ghost_text = true;

            mapping = {
              "<C-j>" = "require('cmp').mapping.select_next_item()";
              "<C-k>" = "require('cmp').mapping.select_prev_item()";
              "<Tab>" = ''
                require('cmp').mapping(function(fallback)
                  local cmp = require("cmp")
                  local luasnip = require("luasnip")
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                  else
                    fallback()
                  end
                end, { "i", "s" })
              '';
              "<S-Tab>" = ''
                require('cmp').mapping(function(fallback)
                  local cmp = require("cmp")
                  local luasnip = require("luasnip")
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                  else
                    fallback()
                  end
                end, { "i", "s" })
              '';
              "<C-e>" = "require('cmp').mapping.abort()";
              "<C-f>" = "require('cmp').mapping.scroll_docs(4)";
              "<C-b>" = "require('cmp').mapping.scroll_docs(-4)";
              "<C-Space>" = "require('cmp').mapping.complete()";
              "<CR>" = "require('cmp').mapping.confirm({ select = true })";
            };

            sources = [
              { name = "nvim_lsp"; }
              { name = "luasnip"; keyword_length = 3; }
              { name = "buffer"; keyword_length = 5; }
              { name = "path"; keyword_length = 3; }
            ];

            formatting = {
              fields = [ "kind" "abbr" "menu" ];
              expandable_indicator = true;
            };

            performance = {
              debounce = 60;
              fetching_timeout = 200;
              max_view_entries = 30;
            };

            window = {
              completion = {
                border = "rounded";
                winhighlight =
                  "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
              };
              documentation = {
                border = "rounded";
              };
            };
          };
        };
      };

      extraConfigLua = ''
        local luasnip = require("luasnip")
        local cmp = require'cmp'

        cmp.setup.cmdline({ '/', '?' }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })

        cmp.setup.filetype('gitcommit', {
          sources = cmp.config.sources({
            { name = 'cmp_git' },
          }, {
            { name = 'buffer' },
          })
        })

        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          })
        })
      '';
    };
  };
}
