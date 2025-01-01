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

        yq = yq-go;

        /*
        <%= if (infra) { %>
        */
        helm = kubernetes-helm;
        /*
        <%= } %>
        */

        inherit

          # standard
          coreutils
          findutils
          gnugrep
          gnused
          jq
          bash

          git
          curl
          infisical

          treefmt
          gitlint
          shellcheck

          # language
          bun

          /*
          <%= if (infra) { %>
          */
          #infra
          kubectl
          k3d

          docker
          hadolint

          helm-docs
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

