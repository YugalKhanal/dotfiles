#!/usr/bin/env bash

git add .
nix flake update
nixos-rebuild switch --flake . --use-remote-sudo --show-trace
home-manager switch --flake .
