{ config, lib, ... }:
let
  cfg = config.modules.desktop.terminal.wezterm;
in
{
  options.modules.desktop.terminal.wezterm = {
    enable = lib.mkEnableOption "Enables wezterm";
  };

  config = lib.mkIf cfg.enable {
    programs.wezterm = {
      enable = true;
      extraConfig = builtins.readFile ./wezterm.lua;
    };
  };
}
