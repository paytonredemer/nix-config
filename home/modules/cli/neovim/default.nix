{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    # plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
    extraPackages = with pkgs; [
      tree-sitter
      unzip
      wget
      gcc
      nodejs_21
      ripgrep 
      fd
    ];
  };
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/repos/nix-config/home/modules/cli/neovim/nvim";
}
