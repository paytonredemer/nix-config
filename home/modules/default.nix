{ lib, ... }:
{
  imports = [
    ./shell
    ./editor
  ];

  modules = {
    shell.enable = lib.mkDefault true;
    editor.enable = lib.mkDefault true;
  };

  # Enable unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
