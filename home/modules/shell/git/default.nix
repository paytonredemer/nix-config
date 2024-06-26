{ config, lib, ... }:
let
  cfg = config.modules.shell.git;
in
{
  options = {
    modules.shell.git.enable = lib.mkEnableOption "Enables git configuration";
  };

  # TODO: Add signing config option
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "Payton Redemer";
      userEmail = "paytonredemer@gmail.com";
      aliases = {
        pu = "push";
      };
      extraConfig = {
        url = {
          "git@github.com:".insteadOf = "https://github.com/";
        };
      };
      includes = [
        {
          condition = "gitdir:/grmn/**";
          contents = {
            user.email = "payton.redemer@garmin.com";
            core = {
              editor = "nvim";
              longpaths = "true";
              whitespace = "cr-at-eol,tab-in-indent";
              autocrlf = "input";
            };
            credential = {
              "https://git-lfs.garmin.com".provider = "generic";
              "https://gerrit.consumer.garmin.com" = {
                provider = "generic";
              };
            };
            # I think this is deprecated but IDK
            # url = {
            # "\"ssh://git@gitdist.consumer.garmin.com:29418/\"" = {
            # insteadOf = "ssh://git@gitdist.consumer.garmin.com/";
            # insteadOf = "ssh://gitdist.consumer.garmin.com/";
            #   };
            # };
            merge.ff = "false";
            fetch = {
              recurseSubmodules = "false";
              prune = "true";
            };
            commit.template = builtins.toPath ./git-template.txt;
            color.ui = "true";
            difftool.prompt = "false";
          };
        }
      ];
    };
  };
}
