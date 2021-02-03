{ stdenv, pkgs, ruby }:

pkgs.callPackage ./guezzlpage.nix {
  inherit ruby;
  dependencies = with pkgs; [
    pngcrush
    imagemagick7
  ];
}
