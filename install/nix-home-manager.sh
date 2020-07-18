#!/usr/bin/env bash


setupNix () {
  # https://nixos.org/nix/manual/#sect-macos-installation 
  sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
}

setupHomeManager () {
  # add channels for home manager
  nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
  nix-channel --update

  home-manager switch
}

setupNix
setupHomeManager
