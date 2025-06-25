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
