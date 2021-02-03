#!/usr/bin/env nix-shell
#!nix-shell -i bash -p git

set -e
set -u

lockfile=/tmp/guezzldeployer.lock

echo "DEPLOY-ONCE.SH started at $(date)"

while [ -f "$lockfile" ]; do
	echo "waiting for lock..."
	sleep 1s
done
echo "aquire lock"
touch "$lockfile"
trap "rm '$lockfile'" EXIT

cd "$HOME/guezzlpage"

git checkout production
git pull origin production

# this doesn't give that many different folders
# to save space
# NOTE: have an userscore in front to not have 
# jekyll copy the built websites into sucessive builds
folder="_production-$(git rev-parse HEAD | cut -c1)"
[ -d "$folder" ] && rm -rf ./"$folder"
mkdir "$folder"

# now we have an empty folder, lets run a full jekyll build into it
umask 027
nix-shell --run "jekyll build --no-watch -d $folder" shell.nix

# atomically change the symlink to the built folder,
# for no interruption when serving
ln -sfn "$folder" _site
