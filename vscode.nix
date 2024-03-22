{ lib, config, pkgs, ... }:
let
  has_pat = lib.pathExists secrets/pat.age;
in
{
  imports = [
    ./neovim
    ./zsh
    ./kitty.nix
  ];

  home = {
    username = "vscode";
    homeDirectory = "/home/vscode";

    stateVersion = "23.11"; # Please read the comment before changing

  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };

  myModules = {
    zsh = {
      enable = true;
    };

    # For terminfo
    kitty = {
      enable = true;
    };
  };
}
