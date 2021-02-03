with (import <nixpkgs> {});
let
  guezzlPage = pkgs.callPackage ./guezzlpage.nix { };
in stdenv.mkDerivation {
  name = "guezzlpage-shell";

  buildInputs = [
    guezzlPage
    ruby.devEnv
    bundix
  ];

  shellHook = ''
    echo $BUNDLE_BIN
    echo $GEM_PATH
    echo $GEM_HOME
  '';
}
