{ pkgs, pkgs-2411, atomi }:
let

  all = {
    atomipkgs = (
      with atomi;
      { }
    );
    nix-unstable = (
      with pkgs;
      { }
    );
    nix-2411 = (
      with pkgs-2411;
      { }
    );
  };
in
with all;
nix-2411 //
nix-unstable //
atomipkgs
