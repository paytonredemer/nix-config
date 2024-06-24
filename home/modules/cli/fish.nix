{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.cli.fish;
  editor = "nvim";
in
{
  options = {
    cli.fish.enable = lib.mkEnableOption "Enables fish";
  };

  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      shellInit = ''
        set -U fish_greeting # disable fish greeting
        set -U fish_key_bindings fish_vi_key_bindings

        fish_add_path $HOME/.local/bin/
      '';
      shellAbbrs = {
        e = editor;
        v = editor;
        g = "git";
        h = "history";
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
      plugins = [
        {
          name = "fzf";
          src = pkgs.fishPlugins.fzf-fish.src;
        }
      ];
    };
  };
}
