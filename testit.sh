#!/usr/bin/env bash
set -euo pipefail

echo hi this is test
uname -a

# sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume

# source $HOME/.nix-profile/etc/profile.d/nix.sh

source install/nix-home-manager.sh
