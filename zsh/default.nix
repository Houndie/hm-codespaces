{ lib, config, pkgs, ... }:
let
  custom = ".config/oh-my-zsh";
  cfg = config.myModules.zsh;
in
{
  options.myModules.zsh = {
    enable = lib.mkEnableOption "zsh";
    initExtraFirst = lib.mkOption {
      default = "";
      type = lib.types.lines;
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
        oh-my-zsh = {
          enable = true;
          plugins = ["git" "git-extras" "dircycle" "vi-mode"];
          custom = "$HOME/${custom}";
          theme = "frosted";
        };
	initExtraFirst = cfg.initExtraFirst;
      };

      direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
      };
    };

    home.file."${custom}" = {
      source = ./custom;
      recursive = true;
    };
  };
}
