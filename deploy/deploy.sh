#!/usr/bin/env nix-shell
#!nix-shell -i bash -p git

set -u

# delete all previous folders
# built by jekyll
( cd "$HOME/guezzlpage";
	rm -rf production-*
)

"$HOME/deploy-once.sh"

while true; do
	$HOME/wait-connection 0.0.0.0 50001
	"$HOME/deploy-once.sh"
	sleep 30
	# really simple 'rate limiting'
done
