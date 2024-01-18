{
  imports = [
    ./keymaps.nix
    ./options.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
  };
}
