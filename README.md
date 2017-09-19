# Guezzl-page

The Homepage for our band called Güssl. It's based on Jekyll. Dependency Management is done with Nix and Direnv.


# How to add a Gem:

 * Edit the `Gemfile`
 * Execute `bundler lock` to generate Gemfile.lock. You can also do this with nix-shell directly `nix-shell -p bundler --command "bundler lock"`.
 * Execute `bundix`. With nix shell: `nix-shell -p bundix --command bundix`
 * This will regenerate gemset.nix and direnv should now load the new environment with the gems in it.


