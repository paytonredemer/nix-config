{ config, lib, ... }:

let
  cfg = config.modules.desktop.wm.qtile;
in
{
  options.modules.desktop.wm.qtile = {
    enable = lib.mkEnableOption "Enables qtile";
  };

  # TODO: Install package with Nix?
  config = lib.mkIf cfg.enable {
    xdg.configFile = {
      "qtile".source = ./qtile;
    };
  };
}
