{ pkgs, atomi, pkgs-2511, pkgs-unstable }:
let
  all = rec {
    atomipkgs = (
      with atomi;
      rec {
        dotnetlint = atomi.dotnetlint.override { dotnetPackage = nix-2511.dotnet; };
        /*
        <%= if (infra) { %>
        */
        helmlint = atomi.helmlint.override { helmPackage = infrautils; };
        /*
        <%= } %>
        */
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
          dn-inspect
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
        dotnet = dotnet-sdk_10;
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
nix-2511 //
nix-unstable //
atomipkgs

