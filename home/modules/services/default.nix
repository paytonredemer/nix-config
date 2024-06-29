{ lib, ... }:
{
  imports = [
    ./dunst.nix
    ./i3status.nix
    ./picom.nix
    ./waybar
  ];

  modules.services = {
    dunst.enable = lib.mkDefault false;
    i3status.enable = lib.mkDefault false;
    picom.enable = lib.mkDefault false;
    waybar.enable = lib.mkDefault false;
  };
}
