{ pkgs, packages }:
with packages;
{
  system = [
    coreutils
    findutils
    gnugrep
    gnused
    bash
    jq
    yq
    curl
  ];

  dev = [
    pls
    git
    air
  ];

  /*
    <%= if (infra) { %>
  */
  infra = [
    kubectl
    k3d
    helm
  ];
  /*
    <%= } %>
  */


  main = [
    gcc
    go
    infisical
  ];

  lint = [
    # core
    treefmt
    gitlint
    shellcheck
    sg

    golangci-lint

    /*
      <%= if (infra) { %>
    */
    hadolint
    helm-docs
    /*
      <%= } %>
    */
  ];

  releaser = [
    sg
  ];

}
