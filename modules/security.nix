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
    # extraConfig = "
    #   Host github.com
    #   User git
    #   IdentityFile ~/.ssh/github-shonenxnaifu
    #   IdentitiesOnly yes
    # ";
    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/github-shonenxnaifu";
        identitiesOnly = true;
      };
      "vps-seulgi" = {
        hostname = "103.235.72.200";
        user = "root";
        identityFile = "~/.ssh/ssh_vps_seulgi";
      };
    };
  };
}
