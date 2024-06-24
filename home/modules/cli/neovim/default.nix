{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.cli.neovim;
in
{
  options = {
    cli.neovim.enable = lib.mkEnableOption "Enables neovim";
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
      defaultEditor = true;
      vimAlias = true;
      extraLuaPackages =
        luaPkgs: with luaPkgs; [
          jsregexp # luasnip
        ];
      extraPackages = with pkgs; [
        # General nvim dependencies
        tree-sitter
        luajitPackages.luarocks
        gcc
        nodejs_22
        ripgrep
        fd
        lua
        luajit
        fzf
        gnumake

        # LSPs
        clang-tools
        ltex-ls
        lua-language-server
        nil
        nodePackages.bash-language-server
        nodePackages.eslint
        pyright
        # rPackages.languageserver # not working
        rust-analyzer
        typescript

        # null-ls
        black
        codespell
        commitlint # this is broken
        gitlint
        mypy
        nixfmt-rfc-style
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
      # Install treesitter parsers with nix
      "nvim/parser".source = "${pkgs.symlinkJoin { name = "treesitter-parsers"; paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies; }}/parser";
    };
  };
}
