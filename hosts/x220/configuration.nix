{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/base.nix
      ../../modules/networking.nix
      ../../modules/printing.nix
      ../../modules/sound.nix
      ../../modules/ssh.nix
      ../../modules/nix.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "x220";
  time.timeZone = "America/Chicago";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.payton = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      firefox
    ];
  };

  environment.systemPackages = with pkgs; [
    # TODO: Use user packages or this?
  ];

  system.stateVersion = "23.11";
}
