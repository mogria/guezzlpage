{ bundlerEnv, ruby, clang, dependencies ? [] }:

bundlerEnv {
    name = "guezzlpage-bundler-env";
    inherit ruby;
    builtInputs = dependencies;
    nativeBuildInputs = [ clang ];
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
}
