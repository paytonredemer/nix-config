{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    defaultEditor = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      tree-sitter
      unzip
      wget
      gcc
      nodejs_21
      ripgrep 
      fd
      # LSPs
      clang-tools
      nodePackages.pyright
      lua-language-server
      rust-analyzer
      nil
      nodePackages.bash-language-server
      typescript
      nodePackages.eslint
      ltex-ls
      # rPackages.languageserver # not working
      # null-ls
      nodePackages.cspell
      nodePackages.alex
      black
      mypy
      shellcheck
      stylua
    ];
  };
  xdg.configFile = {
    "nvim/init.lua".source = ./nvim/init.lua;
    "nvim/lua".source = ./nvim/lua;
    "nvim/stylua.toml".source = ./nvim/stylua.toml;
    "nvim/lazy-lock.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/repos/nix-config/home/modules/cli/neovim/nvim/lazy-lock.json";
    # Below may be needed if treesitter parsers break for some reason: https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position
    # "nvim/parser".source = "${pkgs.symlinkJoin { name = "treesitter-parsers"; paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies; }}/parser";
  };
}
