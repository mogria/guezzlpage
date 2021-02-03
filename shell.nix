with (import <nixpkgs> {});
let
  ruby = ruby_2_7;
  guezzlPage = pkgs.callPackage ./guezzlpage.nix { inherit ruby; };
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
