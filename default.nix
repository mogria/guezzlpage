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
          # This should go into shell.nix
          # https://nixos.wiki/wiki/Packaging/Ruby
          pkgs.pngcrush
          pkgs.imagemagick7
          pkgs.ruby.devEnv
          pkgs.bundix
        ];
    };
}
