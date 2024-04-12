{
  # HACK: Relies on connection to sourcehut which work doesn't allow
  manual.manpages.enable = false;

  programs.git = {
    enable = true;
    userName = "Payton Redemer";
    userEmail = "payton.redemer@garmin.com";
    extraConfig = {
      core = {
        editor = "nvim";
        longpaths = "true";
        whitespace = "cr-at-eol,tab-in-indent";
        autocrlf = "true";
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
      # IDK what this does
      # init.templateDir = "~/.git-template";
    };
  };
}
