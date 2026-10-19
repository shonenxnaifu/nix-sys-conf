{
  config,
  pkgs,
  lib,
  ...
}:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      222
      443
    ];
    allowPing = true;
  };

  services.openssh.enable = true;
  programs.ssh = {
    extraConfig = ''
      Host github.com
      User git
      IdentityFile ~/.ssh/github-shonenxnaifu
      IdentitiesOnly yes

      Host vps-seulgi
      HostName = "103.235.72.200";
      User = "root";
      IdentityFile = "~/.ssh/ssh_vps_seulgi";
    '';
  };
}
