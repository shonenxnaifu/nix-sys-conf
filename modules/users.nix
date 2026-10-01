{
  pkgs,
  ...
}:
{
  users.users."shonenxnaifu" = {
    isNormalUser = true;
    description = "Pawitra Warda";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };
}
