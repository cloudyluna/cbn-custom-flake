# cbn-custom-flake

A simple nix flake to install Cataclysm: Bright Nights with my
preferred set of mods. Currently I'm targeting v0.6.0 (stable) version of CBN and their compatible mods.

This flake is largely derived from my own custom [CDDA experimental flake](https://github.com/cloudyluna/cdda-custom-experimental).

(WIP) Documentation in-progress.

## Install or run

### Install remotely
`nix profile install --refresh github:cloudyluna/cbn-custom-flake#extras`

and run `cbn-tiles-launcher` to play.

### Run remotely
`nix run --refresh github:cloudyluna/cbn-custom-flake#extras` to just run quickly.

## User folder
Saves are located in `$HOME/.cbn-custom`.



