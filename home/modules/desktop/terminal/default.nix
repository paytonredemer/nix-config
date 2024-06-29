{ lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./wezterm
  ];

  modules.desktop.terminal = {
    alacritty.enable = lib.mkDefault false;
    wezterm.enable = lib.mkDefault false;
  };
}
