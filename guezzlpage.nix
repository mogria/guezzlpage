{ bundlerEnv, ruby, dependencies ? [] }:

bundlerEnv {
    name = "guezzlpage-bundler-env";
    inherit ruby;
    builtInputs = dependencies;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
}
