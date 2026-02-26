{ pkgs, pkgs-2511, pkgs-unstable, atomi }:
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
      with pkgs-unstable;
      { }
    );
    nix-2511 = (
      with pkgs-2511;
      {
        inherit
          git
          infisical
          treefmt
          gitlint
          shellcheck
          markdownlint-cli2
          ;
      }
    );
  };
in
with all;
nix-2511 //
nix-unstable //
atomipkgs
