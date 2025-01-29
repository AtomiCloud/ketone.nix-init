{ pkgs, pkgs-2411, atomi }:
let

  all = {
    atomipkgs = (
      with atomi;
      {
        inherit
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
          atomiutils

          git

          infisical
          bun

          treefmt
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
