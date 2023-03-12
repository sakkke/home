# home

sakkke's `~/.config/nixpkgs/home.nix`.

## Require

- NixOS

## Setup

```sh
# Add channels
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz home-manager
nix-channel --update

# Fix NIX_PATH to install home-manager
export NIX_PATH="nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs:home-manager=$HOME/.nix-defexpr/channels/home-manager"

# Install home-manager
nix-shell '<home-manager>' -A install
```

## Install

### Install via git

This installation requires `git` command.
To install `git`, manually add `pkgs.git` to `home.packages` in `~/.config/nixpkg/home.pkg`.

```sh
# Clone home.git
git clone https://github.com/sakkke/home.git ~/home

# Create a symlink for home.nix
ln -fs ~/home/home.nix ~/.config/nixpkgs/home.nix

# Switch to new environment
home-manager switch
```

A little after!
You must need to re-login for applying session variables such as `NIX_PATH`.
