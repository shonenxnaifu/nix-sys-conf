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
        rebuild = "sudo nixos-rebuild switch --flake ~/nix#nixos-pc";
      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/nix#nixos-pc";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "z"
        ];
        theme = "robbyrussell";
      };
    };

    lazygit = {
      enable = true;
      enableBashIntegration = true;
    };

    ghostty = {
      enable = true;
      settings = {
        themes = "Catppuccin Mocha";
      };
    };
  };

  home.stateVersion = "26.05";
}
