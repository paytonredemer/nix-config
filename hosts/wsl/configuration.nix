# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ inputs, lib, pkgs, ... }:

{
  # imports = [
  #   # include NixOS-WSL modules
  #   <nixos-wsl/modules>
  # ];

  wsl = {
    enable = true;
    defaultUser = "payton";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.payton = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "docker"
    ];
    hashedPassword = "";
    # add your own ssh public key
    # openssh.authorizedKeys.keys = [
    #   "ssh-rsa ..."
    # ];
  };

  programs.fish.enable = true;
  programs.git.enable = true;
  programs.tmux.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    home-manager
    fzf
    htop
    libqalculate
    gnumake
    lf
    gcc
    xclip
    nodejs_21
    wget
    unzip
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
