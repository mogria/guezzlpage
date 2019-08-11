{ bundlerEnv, ruby }:
bundlerEnv rec {
    name = "guezzl-page";
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
    inherit ruby;
}
