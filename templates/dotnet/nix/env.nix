{ pkgs, packages }:
with packages;
{
  system = [
    atomiutils
  ];

  dev = [
    pls
    git
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
    dotnet
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
    infralint
    /*
      <%= } %>
    */
  ];

  releaser = [
    sg
  ];

}
