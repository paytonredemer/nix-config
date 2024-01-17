{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
  xdg.configFile = {
    "nvim".source = ./nvim;
  };

  home.packages = with pkgs; [
    nil
    llvmPackages_16.clang-unwrapped
    nodePackages.pyright
    rust-analyzer
    sumneko-lua-language-server
    nodePackages.bash-language-server
    nodePackages.typescript-language-server
    nodePackages.eslint
    ltex-ls
  ];
}
