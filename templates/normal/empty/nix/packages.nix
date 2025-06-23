{ pkgs, pkgs-2505, pkgs-unstable, atomi }:
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
    nix-2505 = (
      with pkgs-2505;
      { }
    );
  };
in
with all;
nix-2505 //
nix-unstable //
atomipkgs
