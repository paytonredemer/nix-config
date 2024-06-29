{ config, lib, ... }:
let
  cfg = config.modules.desktop.browser.firefox;
in
{
  options.modules.desktop.browser.firefox = {
    enable = lib.mkEnableOption "Enables firefox";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
