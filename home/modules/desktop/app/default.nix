{ lib, ... }:
{
  imports = [
    ./rofi.nix
    ./zathura.nix
  ];

  modules.desktop.app = {
    rofi.enable = lib.mkDefault false;
    zathura.enable = lib.mkDefault false;
  };
}
