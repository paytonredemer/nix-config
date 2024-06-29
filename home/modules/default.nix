{ lib, ... }:
{
  imports = [
    ./cli
    ./editor
  ];

  cli.enable = lib.mkDefault true;
  modules.editor.enable = lib.mkDefault true;

  # Enable unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
