# NixOS PC Config

My personal NixOS configuration (flake-based) for my PC.

## Specs

- **Host:** `nixos-pc`
- **NixOS:** 26.05
- **Desktop:** GNOME + [niri](https://github.com/YaLTeR/niri) (Wayland scrollable-tiling)
- **Shell:** zsh (oh-my-zsh)
- **GPU:** NVIDIA RTX-3060

## Structure

```
├── flake.nix              # Flake inputs & NixOS system config
├── configuration.nix     # Main system configuration
├── hardware-configuration.nix
├── home.nix               # Home-manager config (user: shonenxnaifu)
├── modules/
│   ├── security.nix       # Firewall & SSH config
│   └── users.nix          # User accounts
└── config/
    └── niri-config.kdl    # niri window manager config
```

## Usage

Rebuild the system:

```sh
sudo nixos-rebuild switch --flake ~/nix#nixos-pc
```

Or use the alias (defined in home.nix):

```sh
rebuild        # switch
rebuild-test   # test without boot entry
```
