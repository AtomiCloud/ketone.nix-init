{
  description = "var__description__";
  inputs = {
    # util
    flake-utils.url = "github:numtide/flake-utils";

    # registry
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-2411.url = "nixpkgs/nixos-24.11";
    atomipkgs.url = "github:AtomiCloud/nix-registry/v2";
  };
  outputs =
    { self

      # utils
    , flake-utils

      # registries
    , atomipkgs
    , nixpkgs
    , nixpkgs-2411

    } @inputs:
    (flake-utils.lib.eachDefaultSystem
      (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          pkgs-2411 = nixpkgs-2411.legacyPackages.${system};
          atomi = atomipkgs.packages.${system};
        in
        with rec {
          packages = import ./nix/packages.nix
            {
              inherit pkgs pkgs-2411 atomi;
            };
          env = import ./nix/env.nix {
            inherit pkgs packages;
          };
          devShells = import ./nix/shells.nix {
            inherit pkgs env packages;
            shellHook = "";
          };
        };
        {
          inherit packages devShells;
        }
      )
    )
  ;

}
