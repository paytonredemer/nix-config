{ lib, ... }:
{
  imports = [ ./font.nix ];

  modules.themes = {
    font.enable = lib.mkDefault false;
  };
}
