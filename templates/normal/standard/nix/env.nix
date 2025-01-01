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
  ];

  dev = [
    pls
    git
  ];

  main = [
    infisical
  ];

  lint = [
    # core
    treefmt
    gitlint
    shellcheck
    sg
  ];

  releaser = [
    sg
  ];
}
