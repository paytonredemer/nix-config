{ pkgs, ... }:
{
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    # TODO: Figure out why nix-ssh is included here
    trusted-users = [ "@wheel" "root" "nix-ssh" ];
  };

  nixpkgs.config.allowUnfree = true;
}
