{
  imports = [
    ./plugins
    ./keymaps.nix
    ./options.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.kanagawa.enable = true;
  };
}
