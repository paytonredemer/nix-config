{ inputs, config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    defaultEditor = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      # General nvim dependencies
      # TODO: Remove and install treesitter with nix
      tree-sitter
      gcc
      nodejs_21
      ripgrep 
      fd

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
      commitlint
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
    "nvim/init.lua".source = "${inputs.nvim-config}/init.lua";
    "nvim/lua".source = "${inputs.nvim-config}/lua";
    "nvim/stylua.toml".source = "${inputs.nvim-config}/stylua.toml";
    "nvim/lazy-lock.json".source = "${inputs.nvim-config}/lazy-lock.json";
    # Below may be needed if treesitter parsers break for some reason: https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position
    # "nvim/parser".source = "${pkgs.symlinkJoin { name = "treesitter-parsers"; paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies; }}/parser";
  };
}
