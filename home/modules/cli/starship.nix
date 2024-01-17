{ lib, ...}:

{
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_status"
        "$git_metrics"
        "$fill"
        "$line_break"
        "$character"
      ];
      add_newline = false;
      line_break.disabled = false;
      character = {
        success_symbol = "[❯](white)";
        error_symbol = "[❯](red)";
      };
      package.disabled = true;
      username = {
        style_user = "green";
        style_root = "black bold";
        format = "[$user]($style)";
        disabled = false;
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        format = "[$ssh_symbol](bold blue)[@](green)[$hostname](green) ";
        trim_at = ".companyname.com";
        disabled = false;
      };
      directory = {
        truncate_to_repo = false;
        truncation_length = 8;
        read_only = " ";
        style = "blue";
      };
      git_branch = {
        symbol = " ";
        format = "[$symbol$branch(:$remote_branch)](red) ";
        # format = "[$symbol$branch(:$remote_branch)]($style) ";
        # ignore_branches = ["master", "main"];
      };
      git_commit.format = "[$hash$tag]($style) ";
      git_metrics.disabled = true;
      fill.symbol = " ";
      cmd_duration.format = "[$duration]($style) ";
      time = {
        disabled = true;
        format = "[$time]($style) ";
        time_format = "%T";
      };
      gcloud.disabled = true;
    };
  };
}
