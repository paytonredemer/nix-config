{ lib, ... }:
{
  imports = [
    ./i3.nix
    ./hyprland.nix
    ./qtile
  ];

  modules.desktop.wm = {
    i3.enable = lib.mkDefault false;
    hyprland.enable = lib.mkDefault false;
    qtile.enable = lib.mkDefault false;
  };
}
