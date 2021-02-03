{ stdenv, pkgs, ruby }:

pkgs.callPackage ./guezzlpage.nix {
  inherit ruby;
  dependencies = [
    pngcrush
    imagemagick7
  ];
}
