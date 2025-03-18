#!/usr/bin/env bash

git add .
nix-channel update
nix flake update
nixos-rebuild switch --flake . --use-remote-sudo
home-manager switch --flake .
