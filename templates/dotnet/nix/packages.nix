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
        dotnet = dotnet-sdk_9;
        inherit

          # standard
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

