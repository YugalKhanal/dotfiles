#!/usr/bin/env bash

nix-channel update
nix flake update
nixos-rebuild switch --flake . --use-remote-sudo
