{ config, lib, pkgs, ... }:

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

  programs.nh.enable = true;

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

  programs.ghostty = {
    enable = true;
    settings = {
      window-decoration = false;
      confirm-close-surface = false;
    };
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    aggressiveResize = true;
    clock24 = true;
    keyMode = "vi";
    prefix = "C-space";
    newSession = true;
    secureSocket = true;
    sensibleOnTop = true;
    escapeTime = 0;
    terminal = "screen-256color";
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      yank
    ];
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
    # extraConfig = ''
    #   # set-option -sa terminal-overrides ",xterm*:Tc"
    #
    #   # set -as terminal-features ",xterm-256color:RGB"
    #   set -g default-terminal "tmux-256color"
    #   set -ga terminal-overrides ",xterm-256color:RGB"
    #
    #   # Move status bar to the top
    #   set-option -g status-position top
    #
    #   # Vim navigation keys for pane navigation
    #   bind-key h select-pane -L
    #   bind-key j select-pane -D
    #   bind-key k select-pane -U
    #   bind-key l select-pane -R
    #
    #   # keybindings
    #   bind-key -T copy-mode-vi v send-keys -X begin-selection
    #   bind-key -T copy-mode-vi C-v send-keys -X rectanble-toggle
    #   bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    #
    #   # Open panes in current directory
    #   bind '"' split-window -v -c "#{pane_current_path}"
    #   bind % split-window -h -c "#{pane_current_path}"
    #
    #   # Remap leader+n/p to leader+h/l
    #   unbind n
    #   unbind p
    #   bind h previous-window
    #   bind l next-window
    # '';
  };

  home.packages = with pkgs; [
    btop
    gtk3
    gtk4
    ghostty
    vimPlugins.nvim-cmp
    bat
    fd
    protonvpn-gui
    ripgrep
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
    base16-schemes
    # texlivePackages.latexindent
    (texlive.withPackages (ps: [ ps.titlesec ps.latexindent ]))


    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  stylix = {
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/base16-vim.yaml";
    base16Scheme = {
      base00 = "#181818"; # Background
      base01 = "#282828";
      base02 = "#383838";
      base03 = "#585858";
      base04 = "#b8b8b8";
      base05 = "#d8d8d8"; # Default Text
      base06 = "#e8e8e8";
      base07 = "#f8f8f8";
      base08 = "#ab4642"; # Red
      base09 = "#dc9656"; # Orange
      base0A = "#f7ca88"; # Yellow
      base0B = "#a1b56c"; # Green
      base0C = "#86c1b9"; # Cyan
      base0D = "#7cafc2"; # Blue
      base0E = "#ba8baf"; # Purple
      base0F = "#a16946"; # Brown
    };
    image = ./1363709.png;
    cursor = {
      name = "Banana cursor";
      package = pkgs.banana-cursor;
      size = 50;
    };
    fonts = {
      sizes = {
        terminal = 11;
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
    polarity = "dark";
    targets = {
      tmux.enable = true;
      nixvim.enable = true;
      ghostty.enable = true;
      waybar.enable = true;
      zathura.enable = true;
      vesktop.enable = true;
      fzf.enable = false;
      gtk.enable = true;
      hyprland.enable = true;
      rofi.enable = true;
      swaync.enable = true;
      vim.enable = true;
      btop.enable = true;
      lazygit.enable = true;
      mpv.enable = true;
    };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Banana";
      package = pkgs.banana-cursor;
      size = 50;
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
    # XCURSOR_THEME = "banana-cursor"; # Set the banana cursor theme
    # XCURSOR_SIZE = "50"; # Optional: Set cursor size

  };

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
