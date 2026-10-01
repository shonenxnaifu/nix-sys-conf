{
  pkgs,
  ...
}:
{
  users.users."shonenxnaifu" = {
    isNormalUser = true;
    description = "Pawitra Warda";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      #  thunderbird
    ];
  };
}
