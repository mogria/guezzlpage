{ pkgs ? import <nixpkgs> {} }:
let
    inherit pkgs;
    stdenv = pkgs.stdenv;
    guezzelPageBundlerEnv = pkgs.bundlerEnv rec {
        name = "guezzl-page";
        gemdir = ./.;
        ruby = pkgs.ruby;
    };
in rec {
    guezzelPageEnv = stdenv.mkDerivation rec {
        name = "guezzl-page-env";
        buildInputs = [ guezzelPageBundlerEnv pkgs.pngcrush pkgs.imagemagick pkgs.php70 pkgs.php70Packages.composer pkgs.exiv2 ];
    };
}
