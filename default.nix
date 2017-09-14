let
    pkgs = import <nixpkgs> {};
    stdenv = pkgs.stdenv;
in rec {
    guezzelPageEnv = stdenv.mkDerivation rec {
        name = "jekyll-env";
        buildInputs = [pkgs.jekyll];
    };
}
