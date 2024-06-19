{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/base.nix
      ../../modules/bootloader.nix
      ../../modules/networking.nix
      ../../modules/nix.nix
      ../../modules/ssh.nix
      ../../modules/tailscale.nix
      ../../modules/sound.nix
      ../../modules/printing.nix
      ../../modules/user.nix
    ];

  networking.hostName = "t480s";
  time.timeZone = "America/Chicago";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager
    firefox
    # add overlay instead of manually downloading
    citrix_workspace
  ];

  system.stateVersion = "23.11";
}
