{ pkgs, atomi, pkgs-2411 }:
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
        dotnet = dotnet-sdk_9;
        inherit

          # standard
          atomiutils

          git
          infisical

          treefmt
          gitlint
          shellcheck

          /*
          <%= if (infra) { %>
          */
          #infra
          infrautils
          infralint
          /*
          <%= } %>
          */
          ;
      }
    );

  };
in
with all;
nix-2411 //
nix-unstable //
atomipkgs

