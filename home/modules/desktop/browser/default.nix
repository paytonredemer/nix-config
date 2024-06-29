{ lib, ... }:
{
  imports = [
    ./firefox.nix
  ];

  modules.desktop.browser = {
    firefox.enable = lib.mkDefault false;
  };
}
