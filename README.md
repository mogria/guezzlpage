# Guezzl Band Homepage

The Homepage for our band called Güssl. This is just a statically generated site using Jekyll.

Dependency Management is done with nix, bundix and direnv. Although it should be possible to manage it with bundler and other ruby tools as well, but you'll have to have the same dependencies installed as listed in `default.nix` to run all the shell scripts.

# Images

Using the `bin/scale-site-images.sh` script you can regenerate the PNG images from the original XCF files. This is mostly being done for scaling and removing the white background.

## Development

To run the development site and have changes in posts automatically reflected using LiveReload and Jekyll's incremental build support.

Use the following command to launch jekyll from the using a nix-shell environment containing all the required dependencies:

    $ nix-shell
    [nix-shell:~/Code/guezzlpage]$ bundle exec jekyll serve --livereload
    Configuration file: /home/mogria/Code/guezzlpage/_config.yml
                 Source: /home/mogria/Code/guezzlpage
            Destination: /home/mogria/Code/guezzlpage/_site
      Incremental build: disabled. Enable with --incremental
           Generating...
                    done in 4.532 seconds.
    Auto-regeneration: enabled for '/home/mogria/Code/guezzlpage'
    LiveReload address: http://127.0.0.1:35729
        Server address: http://127.0.0.1:4000/
      Server running... press ctrl-c to stop.


Now use a webbrowser to navigate to http://127.0.0.4000/ to see the your local development site.

### How to add a Gem using nix & bundix:

 * Edit the `Gemfile`
 * If necessary delete the `Gemfile.lock`
 * Run `bundix -l` to regenerate `Gemfile.lock`,
 * Run `bundix -m` to regenerate the `gemset.nix` and
 * You may want to `touch default.nix` for direnv to reload the new environment with the gems in it.



