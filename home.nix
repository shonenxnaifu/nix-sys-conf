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

    # noctalia deps
    # App Launcher
    fuzzel

    # Status bar
    waybar

    # notification
    # mako
    libnotify

    # fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    font-awesome

    # Utilities
    # brightnessctl
    playerctl
    # pamixer
  ];

  fonts.fontconfig.enable = true;

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

    noctalia = {
      systemd.enable = true;
      settings = {
        theme = {
          mode = "dark";
          source = "builtin";
          builtin = "Tokyo-Night";
        };
      
        wallpaper = {
          enabled = true;
          default.path = "${pkgs.adwaita-icon-theme}/share/backgrounds/gnome/blobs-l.svg";
        };

        session = {
          lock_cmd = "swaylock";
          power_off_cmd = "systemctl poweroff";
          reboot_cmd = "systemctl reboot";
        };
      };
    };
  };

  # services.mako.enable = false;
  # Screen lock
  programs.swaylock.enable = true;

  # Niri config from file KDL
  xdg.configFile."niri/config.kdl".source = ./config/niri-config.kdl;
 
  # Wayland environment
  home.sessionVariables = {
    EDITOR = "nvim";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
  };

  home.stateVersion = "26.05";
}
