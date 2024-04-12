{
  imports = [
    ./shell.nix
    ./fish.nix
    # ./git.nix
    ./work
    ./starship.nix
    ./neovim
    ./tmux.nix
    # ./lf.nix
    # ./nixvim
    ./zsh.nix
  ];
  programs.zoxide.enable = true;
}
