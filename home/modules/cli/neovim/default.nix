{ inputs, config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    defaultEditor = true;
    vimAlias = true;
    extraLuaPackages = luaPkgs: with luaPkgs; [lua-utils-nvim nvim-nio pathlib-nvim];
    extraPackages = with pkgs; [
      # General nvim dependencies
      # TODO: Remove and install treesitter with nix
      tree-sitter
      gcc
      nodejs_22
      ripgrep 
      fd
      lua
      luajit

      # LSPs
      clang-tools
      ltex-ls
      lua-language-server
      nil
      nodePackages.bash-language-server
      nodePackages.eslint
      nodePackages.pyright
      # rPackages.languageserver # not working
      rust-analyzer
      typescript

      # null-ls
      alejandra
      black
      codespell
      commitlint # this is broken
      gitlint
      mypy
      nodePackages.alex
      proselint
      shellcheck
      shfmt
      stylua
    ];
  };
  xdg.configFile = {
    "nvim/after".source = ./nvim-config/after;
    "nvim/init.lua".source = ./nvim-config/init.lua;
    "nvim/lua".source = ./nvim-config/lua;
    "nvim/stylua.toml".source = ./nvim-config/stylua.toml;
    "nvim/lazy-lock.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/repos/nix-config/home/modules/cli/neovim/nvim-config/lazy-lock.json";
    # Below may be needed if treesitter parsers break for some reason: https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position
    # "nvim/parser".source = "${pkgs.symlinkJoin { name = "treesitter-parsers"; paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies; }}/parser";
  };
}
