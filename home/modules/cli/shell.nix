{ config, lib, ... }:
let
  cfg = config.cli.shell;
  editor = "nvim";
in
{
  options = {
    cli.shell.enable = lib.mkEnableOption "Enables shell variables";
  };
  config = lib.mkIf cfg.enable {
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
  };
}
