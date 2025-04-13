#!/usr/bin/env bash

git add .
nix flake update
nh os switch .
nh home switch .
# nixos-rebuild switch --flake . --use-remote-sudo --show-trace
# home-manager switch --flake .
