{
  description = "Home Manager configuration of jabenze";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    unstable.url = "nixpkgs/nixos-unstable";

    # Pull request featuring tray functionality
    eww.url = "github:Houndie/eww";

    hyprHelpers.url = "git+ssh://git@git.benze.me:19475/jabenze/hyprHelpers";
    # Backup in case of local network problem
    # hyprHelpers.url = "git+file:///home/jabenze/Projects/hyprHelpers";

    crabtap.url = "github:Houndie/crabtap";
  };

  outputs = { nixpkgs, home-manager, unstable, eww, hyprHelpers, crabtap, ... }:
    {
      homeConfigurations."vscode" = 
        let
          system = "x86_64-linux";
          pkgs = nixpkgs.legacyPackages.${system};

          overlay = final: prev: {
            unstable = unstable.legacyPackages.${prev.system};
          };
        in
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [
              ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay ]; })
              ./vscode.nix 
            ];
          };
    };
}
