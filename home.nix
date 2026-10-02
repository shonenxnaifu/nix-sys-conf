{ config, pkgs, lib, ... }:

let 
  zshGeneral = lib.mkOrder 1000 ''
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';
in
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

      initContent = lib.mkMerge [ zshGeneral ];
    };

    lazygit = {
      enable = true;
      enableBashIntegration = true;
    };

    ghostty = {
      enable = true;
      settings = {
        theme = "Catppuccin Mocha";
        background-opacity = 0.85;
      };
    };
  };

  home.stateVersion = "26.05";
}
