{ pkgs, atomi, pkgs-2505, pkgs-unstable }:
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
      with pkgs-unstable;
      { }
    );
    nix-2505 = (
      with pkgs-2505;
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
nix-2505 //
nix-unstable //
atomipkgs

