{ pkgs, pkgs-2411, atomi }:
let

  all = {
    atomipkgs = (
      with atomi;
      {
        inherit
          sg
          pls;
      }
    );
    nix-unstable = (
      with pkgs;
      { }
    );
    nix-2411 = (
      with pkgs-2411;
      {
        yq = yq-go;
        inherit
          atomiutils
          git
          infisical
          treefmt
          gitlint
          shellcheck
          ;
      }
    );
  };
in
with all;
nix-2411 //
nix-unstable //
atomipkgs
