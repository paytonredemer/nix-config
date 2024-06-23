{pkgs, ...}: let
  editor = "nvim";
in {
  home.sessionVariables = {
    EDITOR = editor;
    BROWSER = "firefox";
    TERMINAL = "wezterm";
    VISUAL = editor;
    # xdg
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CACHE_HOME = "$HOME/.cache";
  };
}
