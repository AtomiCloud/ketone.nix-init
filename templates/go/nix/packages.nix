{ pkgs, atomi, pkgs-2411 }:
let
  all = {
    atomipkgs = (
      with atomi;
      {
        inherit

          /*
          <%= if (infra) { %>
          */
          #infra
          infrautils
          infralint
          /*
          <%= } %>
          */
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

          # standard
          git
          infisical

          treefmt
          gitlint
          shellcheck

          #language
          gcc
          go
          golangci-lint
          air
          ;
      }
    );

  };
in
with all;
nix-2411 //
nix-unstable //
atomipkgs

