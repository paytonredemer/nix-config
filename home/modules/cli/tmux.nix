{pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 10;
    historyLimit = 10000;
    keyMode = "vi";
    mouse = true;
    sensibleOnTop = true;
    shortcut = "b";
    terminal = "screen-256color";
    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        # extraConfig = "set -g @continuum-restore 'on'";
      }
      {
        plugin = tmuxPlugins.fzf-tmux-url;
        extraConfig = ''
          set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
          set -g @fzf-url-bind 'o'
        '';
      }
    ];
    extraConfig = ''
      # fixes for neovim
      set -as terminal-features ",xterm-256color:RGB"
      set-option -g focus-events on

      # renumber windows sequentially after closing any of them
      set -g renumber-windows on

      # status
      set -g status-style 'bg=terminal fg=terminal'
      set-option -g status-position top
      set-option -g status-left ""
      set-option -g status-right ""
      set-option -g status-justify 'right'

      bind-key -T copy-mode-vi v send -X begin-selection # start selecting text with "v"
      bind-key -T copy-mode-vi y send -X copy-selection # copy text with "y"

      bind-key -r ^ last-window
      bind-key -r k select-pane -U
      bind-key -r j select-pane -D
      bind-key -r h select-pane -L
      bind-key -r l select-pane -R

      bind-key l send-keys 'C-l' # alt binding for clearing screen

      # more clear bindings
      bind-key \\ split-window -h
      bind-key - split-window -v
    '';
  };
}
