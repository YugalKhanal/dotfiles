{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      hi = "echo 'Hello, world!'";
      ls = "eza --icons";
      ll = "eza -l --icons";
      la = "eza -la --icons";
      ".." = "cd ..";
      cls = "clear";
      grep = "grep --color=auto";
      home = "home-manager switch --flake .";
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell"; # You can change this to any theme you like
    oh-my-zsh.plugins = [ "git" "z" ]; # Plugins to enhance zsh functionality
    initExtra = ''
      source <(${pkgs.fzf}/bin/fzf --zsh)
      bindkey '^F' fzf-history-widget
    '';
  };

  programs.bash.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
