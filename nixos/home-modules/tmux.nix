{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    aggressiveResize = true;
    clock24 = true;
    keyMode = "vi";
    prefix = "C-space";
    newSession = false;
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
  };

}
