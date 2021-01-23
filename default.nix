{ pkgs ? import <nixpkgs> {} }:
let
    inherit pkgs;
    stdenv = pkgs.stdenv;
    ruby = pkgs.ruby_2_7;
    guezzelPageBundlerEnv = pkgs.callPackage ./guezzlpage.nix {
      inherit ruby;
    };
in rec {
    guezzelPageEnv = stdenv.mkDerivation rec {
        name = "guezzl-page-env";
        buildInputs = [
          guezzelPageBundlerEnv
          # This should go into shell.nix
          # https://nixos.wiki/wiki/Packaging/Ruby
          pkgs.pngcrush
          pkgs.imagemagick7
          ruby.devEnv
          pkgs.bundix
        ];
    };
}
