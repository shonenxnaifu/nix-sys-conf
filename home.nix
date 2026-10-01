{ config, pkgs, ... }:

{
  home.username = "shonenxnaifu";
  home.homeDirectory = "/home/shonenxnaifu";

  home.packages = with pkgs; [
    ripgrep
    fd
    jq
  ];

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/nix#nixos-server";
      };
    };

    lazygit = {
      enable = true;
      enableBashIntegration = true;
    };
  };

  home.stateVersion = "26.05";
}
