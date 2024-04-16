{ inputs, lib, pkgs, ... }:

{
  wsl = {
    enable = true;
    defaultUser = "redemerpayton";
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.redemerpayton = {
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

  virtualisation.docker.enable = true;

  programs.fish.enable = true;
  programs.git.enable = true;
  programs.tmux.enable = true;

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
    vscode-extensions.ms-vscode.cpptools
    gdb
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
