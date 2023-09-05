{ lib, config, pkgs, inputs, ... }:
{
  programs.neovim = {
      enable = true;
      vimAlias = true;
  };
  xdg.configFile = {
    "nvim".source = ./nvim;
  };

  home = {
    packages = with pkgs; [
      unzip
      wget
      gcc
      nodejs_20
      go
      # python312
      # python39
      cargo
      ripgrep
    ];
  };
}
