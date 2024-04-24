{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/base.nix
      ../../modules/networking.nix
      ../../modules/nix.nix
      ../../modules/ssh.nix
      ../../modules/tailscale.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "teddy";
  time.timeZone = "America/Chicago";

  users.users.payton = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    vim 
    home-manager
    fzf
    htop
    libqalculate
    gnumake
    gcc
    xclip
    nodejs_21
    wget
    unzip
    zola
    vscode-extensions.ms-vscode.cpptools
    gdb
  ];

  system.stateVersion = "23.11";
}
