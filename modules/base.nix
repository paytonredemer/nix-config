{ pkgs, ... }:
{
  programs.git.enable = true;
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };
  programs.tmux.enable = true;

  environment.systemPackages = with pkgs; [
    ripgrep
  ];
}
