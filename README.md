# Guezzl-page

The Homepage for our band called Güssl. This is just a statically generated site using Jekyll.

Dependency Management is done with nix, bundix and direnv. Although it should be possible to manage it with bundler and other ruby tools as well, but you'll have to have the same dependencies installed as listed in `default.nix` to run all the shell scripts.

# Images

Using the `bin/scale-site-images.sh` script you can regenerate the PNG images from the original XCF files. This is mostly being done for scaling and removing the white background.

# How to add a Gem using nix & bundix:

 * Edit the `Gemfile`
 * run `bin/nix-bundle-gems.sh` 
 * This will regenerate `Gemfile.lock`, `gemset.nix` and direnv should now load the new environment with the gems in it.

