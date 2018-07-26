#!/usr/bin/env nix-shell
#! nix-shell -p bundix -i bash
exec bundix -l "$@"
