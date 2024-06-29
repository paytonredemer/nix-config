{ config, lib, ... }:
let
  cfg = config.modules.desktop.app.rofi;
in
{
  options.modules.desktop.app.rofi = {
    enable = lib.mkEnableOption "Enables rofi";
  };

  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      theme = "Arc-Dark";
      extraConfig = {
        show-icons = true;
        icon-theme = "Papirus";
      };
    };
  };
}
