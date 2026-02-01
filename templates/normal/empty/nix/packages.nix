{ pkgs, pkgs-2511, pkgs-unstable, atomi }:
let

  all = {
    atomipkgs = (
      with atomi;
      { }
    );
    nix-unstable = (
      with pkgs-unstable;
      { }
    );
    nix-2511 = (
      with pkgs-2511;
      { }
    );
  };
in
with all;
nix-2511 //
nix-unstable //
atomipkgs
