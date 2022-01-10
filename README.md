# Guezzl-page

The Homepage for our band called Güssl. This is just a statically generated site using Jekyll.

Dependency Management is done with nix, bundix and direnv. Although it should be possible to manage it with bundler and other ruby tools as well, but you'll have to have the same dependencies installed as listed in `default.nix` to run all the shell scripts.

# Images

Using the `bin/scale-site-images.sh` script you can regenerate the PNG images from the original XCF files. This is mostly being done for scaling and removing the white background.

# How to add a Gem using nix & bundix:

 * Edit the `Gemfile`
 * If necessary delete the `Gemfile.lock`
 * Run `bundix -l` to regenerate `Gemfile.lock`,
 * Run `bundix -m` to regenerate the `gemset.nix` and
 * You may want to `touch default.nix` for direnv to reload the new environment with the gems in it.


