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
    bun
    infisical
  ];

  lint = [
    # core
    treefmt
    gitlint
    shellcheck
    sg

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
