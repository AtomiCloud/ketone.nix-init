{ pkgs, packages }:
with packages;
{
  system = [
    atomiutils
  ];

  dev = [
    pls
    git
    air
    gopls
  ];

  /*
    <%= if (infra) { %>
  */
  infra = [
    infrautils
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
    deadcode

    /*
      <%= if (infra) { %>
    */
    infralint
    helmlint
    /*
      <%= } %>
    */
  ];

  releaser = [
    sg
  ];

}
