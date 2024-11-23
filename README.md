# cbn-custom-flake

A simple nix flake to install Cataclysm: Bright Nights with my
preferred set of mods. Currently I'm targeting v0.6.0 (stable) version of CBN and their compatible mods.

This flake is largely derived from my own custom [CDDA experimental flake](https://github.com/cloudyluna/cdda-custom-experimental).

(WIP) Documentation in-progress.

## Bundled contents

### extras
- Tankmod_Revived
- jackledead_armory + jackledead_armory_expansion

### expanded
All in `extras` + Otopacks soundpack.

## Install or run

### Install remotely
`nix profile install --refresh github:cloudyluna/cbn-custom-flake#extras`

and run `cbn-tiles-launcher` to play.

### Run remotely
`nix run --refresh github:cloudyluna/cbn-custom-flake#extras` to just run quickly.

If you want music too, replace `#extras` with `#expanded`.

## To update game and contents manually
We use [nvfetcher](https://github.com/berberman/nvfetcher/blob/master/README.md) to run automatic content updates. For more info, see what you can do with nvfetcher.

Game and bundled contents versions are pinned in [_sources/generated.nix](/_sources/generated.nix).

> Warning: Updates doesn't guarantee stability. Things might break. Always check content changelog before update.

To update: `nix develop --command make update` 

## User folder
Saves are located in `$HOME/.cbn-custom`.



