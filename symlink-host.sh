#!/usr/bin/env bash

host=${1:-$(hostname)}
configuration="hosts/$host/configuration.nix"

if [[ ! -e $configuration ]]; then
  echo "missing $configuration" >&2
  exit 1
fi

ln -sf $configuration .

echo "Symlinked $configuration to configuration.nix"
