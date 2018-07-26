{ pkgs ? import <nixpkgs> {} }:
let
    inherit pkgs;
    stdenv = pkgs.stdenv;
    guezzelPageBundlerEnv = pkgs.bundlerEnv rec {
        name = "guezzl-page";
        gemfile = ./Gemfile;
        lockfile = ./Gemfile.lock;
        gemset = ./gemset.nix;
        ruby = pkgs.ruby;
    };
in rec {
    guezzelPageEnv = stdenv.mkDerivation rec {
        name = "guezzl-page-env";
        buildInputs = [ guezzelPageBundlerEnv pkgs.pngcrush pkgs.imagemagick ];
    };
}
