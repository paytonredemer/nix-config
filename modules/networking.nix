{
  # TODO: Add wifi passwords in config
  networking.networkmanager.enable = true;

  users.users.payton.extraGroups = [ "networkmanager" ];
}
