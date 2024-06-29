{ config, lib, ... }:
let
  cfg = config.modules.desktop;
in
{
  imports = [
    ./app
    ./browser
    ./terminal
    ./wm
  ];
  options.modules.desktop = {
    enable = lib.mkEnableOption "Enables desktop";
  };

  config = lib.mkIf cfg.enable {
    modules = {
      desktop = {
        app = {
          rofi.enable = lib.mkForce true;
          zathura.enable = lib.mkForce true;
        };
        browser.firefox.enable = lib.mkForce true;
        terminal = {
          alacritty.enable = lib.mkForce true;
          wezterm.enable = lib.mkForce true;
        };
        wm.i3.enable = lib.mkForce true;
      };
      themes.font.enable = lib.mkForce true;
    };
  };
}
