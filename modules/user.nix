{ pkgs, ... }:

{
  users.users.payton = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ];
  };
  programs.fish.enable = true;
}
