{
  imports = [
    ./shell.nix
    ./fish.nix
    ./git.nix
    ./starship.nix
    ./neovim
    ./tmux.nix
    # ./lf.nix
    # ./nixvim
  ];
  programs.zoxide.enable = true;
}
