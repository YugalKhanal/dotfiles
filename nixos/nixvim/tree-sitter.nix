{ pkgs, ... }:

{
  programs.nixvim = {
    config = {
      plugins.treesitter = {
        enable = true;

        settings = {
          highlight.enable = true;
          indent.enable = true;
          autopairs.enable = true;
          folding.enable = true;
        };

        nixvimInjections = true;

        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          latex
          bash
          json
          lua
          make
          markdown
          nix
          regex
          toml
          vim
          vimdoc
          xml
          yaml
          python
          html
          asm
          go
          javascript
          typescript
          c
          vim
          css
          cpp
          rust
          vimdoc
          git_config
          git_rebase
          gitattributes
          gitcommit
          gitignore
        ];
      };
    };
  };
}
