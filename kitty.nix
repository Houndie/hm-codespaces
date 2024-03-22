{ lib, config, pkgs, ... }:
let
  cfg = config.myModules.kitty;
in
{
  options.myModules.kitty = {
    enable = lib.mkEnableOption "kitty";
    sshConfig = lib.mkOption {
      default = "";
      type = lib.types.lines;
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ pkgs.fira-code ];
      file.".config/kitty/ssh.conf".text = cfg.sshConfig;
    };
  
    programs.kitty = {
      enable = true;
      settings = {
        background_opacity = "0.89";
        background = "#001720";
      };
      theme = "Tokyo Night";
      font = {
        name = "Fira Code";
        size = 12;
      };
    };
  };
}
