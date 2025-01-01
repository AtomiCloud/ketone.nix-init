{ packages, formatter, pre-commit-lib }:
pre-commit-lib.run {
  src = ./.;

  # hooks
  hooks = {
    # formatter
    treefmt = {
      enable = true;
      excludes = [
        ".*(Changelog|README|CommitConventions).+(MD|md)"
      ];
    };
  };

  settings = {
    treefmt = {
      package = formatter;
    };
  };
}
