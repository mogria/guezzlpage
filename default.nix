{ pkgs ? import <nixpkgs> {} }:
let
    inherit pkgs;
    stdenv = pkgs.stdenv;
    guezzelPageBundlerEnv = pkgs.callPackage ./guezzlpage.nix { };
in rec {
    guezzelPageEnv = stdenv.mkDerivation rec {
        name = "guezzl-page-env";
        buildInputs = [
          guezzelPageBundlerEnv
          pkgs.pngcrush
          pkgs.imagemagick7
          pkgs.ruby
          pkgs.bundix
        ];
    };
}
