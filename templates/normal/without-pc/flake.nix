{
  description = "var__description__";
  inputs = {
    # util
    flake-utils.url = "github:numtide/flake-utils";

    # registry
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nixpkgs-2505.url = "nixpkgs/nixos-25.05";
    atomipkgs.url = "github:AtomiCloud/nix-registry/v2";
  };
  outputs =
    { self

      # utils
    , flake-utils

      # registries
    , atomipkgs
    , nixpkgs-2505
    , nixpkgs-unstable

    } @inputs:
    (flake-utils.lib.eachDefaultSystem
      (
        system:
        let
          pkgs-2505 = nixpkgs-2505.legacyPackages.${system};
          pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
          atomi = atomipkgs.packages.${system};
        in
        let pkgs = pkgs-2505; in
        with rec {
          packages = import ./nix/packages.nix
            {
              inherit pkgs pkgs-2505 pkgs-unstable atomi;
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
