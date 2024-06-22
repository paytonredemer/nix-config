{lib, config, ... }: 
let cfg = config.tailscale; in {
  options = {
    tailscale.enable = lib.mkEnableOption "Enables tailscale";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "both";
      extraUpFlags = ["--advertise-exit-node" "--ssh"];
    };
  };
}
