{ config, pkgs, ... }:

{

  imports = [
    ./sh.nix
    ./nixvim
  ];
  # imports = [ /home/yugalkhanal/.dotfiles/nixos/sh.nix ];
  home.username = "yugalkhanal";
  home.homeDirectory = "/home/yugalkhanal";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.tmux = {
    enable = true;
    extraConfig = ''
      # Set Ctrl-R to reload tmux config
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      # Better colours
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Set mouse
      set -g mouse on

      # Set prefix
      unbind C-b
      set -g prefix C-space
      bind C-space send-prefix

      # Set window index to 1 at startup
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'christoomey/vim-tmux-navigator'
      set -g @plugin 'dreamsofcode-io/catppuccin-tmux'
      set -g @plugin 'tmux-plugins/tmux-yank'

      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",xterm-256color:RGB"

      # Nerd font for window name
      set -g @plugin 'joshmedeski/tmux-nerd-font-window-name'

      # Set vi-mode (visual)
      set-window-option -g mode-keys vi

      # Move status bar to the top
      set-option -g status-position top

      # Vim navigation keys for pane navigation
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectanble-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Open panes in current directory
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Remap leader+n/p to leader+h/l
      unbind n
      unbind p
      bind h previous-window
      bind l next-window

      run '~/.tmux/plugins/tpm/tpm'
            set -g default-terminal "tmux-256color"
            set -ga terminal-overrides ",xterm-256color:RGB"
            run-shell ~/.tmux/plugins/tpm/tpm
    '';
  };


  home.packages = with pkgs; [
    vimPlugins.nvim-cmp
    bat
    fd
    protonvpn-gui
    ripgrep
    fzf
    fontconfig
    zoxide
    hello
    eza
    git
    banana-cursor
    swaynotificationcenter
    inetutils
    wlsunset
    wlr-randr
    networkmanagerapplet
    mpi
    nerd-fonts.jetbrains-mono

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "1e1e2e";
      base01 = "181825";
      base02 = "313244"; # surface0
      base03 = "45475a"; # surface1
      base04 = "585b70"; # surface2
      base05 = "cdd6f4"; # text
      base06 = "f5e0dc"; # rosewater
      base07 = "b4befe"; # lavender
      base08 = "f38ba8"; # red
      base09 = "fab387"; # peach
      base0A = "f9e2af"; # yellow
      base0B = "a6e3a1"; # green
      base0C = "94e2d5"; # teal
      base0D = "89b4fa"; # blue
      base0E = "cba6f7"; # mauve
      base0F = "f2cdcd"; # flamingo
    };
    image = ./1363709.png;
    cursor = {
      name = "Banana cursor";
      package = pkgs.banana-cursor;
      size = 50;
    };
    polarity = "dark";
    targets.tmux.enable = true;
    targets.nixvim.enable = true;
    targets.ghostty = {
      enable = true;
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yugalkhanal/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";

    # Add the cursor settings here:
    XCURSOR_THEME = "banana-cursor"; # Set the banana cursor theme
    XCURSOR_SIZE = "24"; # Optional: Set cursor size

  };

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
