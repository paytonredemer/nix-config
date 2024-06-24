{ config, lib, ... }:
let
  cfg = config.cli.zsh;
  editor = "nvim";
in
{
  # TODO: Add more options from dotfiles and make default shell
  options = {
    cli.zsh.enable = lib.mkEnableOption "Enables zsh";
  };

  # TODO: Add vim bindings and other nice to haves in zsh
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting = {
        enable = true;
        # TODO: Update this better
        highlighters = [
          "main"
          "brackets"
          "pattern"
          "root"
          "line"
        ];
      };
      autocd = true;
      defaultKeymap = "viins";
      history = {
        ignoreDups = true;
        share = true;
      };

      zsh-abbr = {
        enable = true;
        abbreviations = {
          e = editor;
          v = editor;
          g = "git";
          h = "history";
        };
      };
      shellAliases = {
        ls = "ls -hN --color=auto --group-directories-first";
        grep = "grep --color=auto";
        cp = "cp -iv";
        mv = "mv -iv";
        rm = "rm -Iv";
        diff = "diff --color=auto";
        ":q" = "exit";
        ":wq" = "exit";
      };
    };
  };
}
