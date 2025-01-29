{ pkgs, pkgs-2411, atomi }:
let

  all = {
    atomipkgs = (
      with atomi;
      {
        inherit
          atomiutils
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
        inherit
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
