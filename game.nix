{
  pkgs,
  lib,
  pinnedSources,
}:
{
  stable = rec {
    gameSource = pinnedSources.game-cbn-tiles-stable-prebuilt;
    extras = {
      /*
        # Add, edit or remove mods/sound packs here.
        # Every mods and sound packs list attribute must have this
        # keys for consistency and documentation.
        # This is subject to change, however.

        {
          name = "Name of mod";

          # Leave as an empty list if you want to copy
          # the whole parent directory.
          subdirs = [
            "sub directory 1"
            "sub directory 2"
          ];

          # The mod package source.
          # You could use `builtins.fetchGit` or `lib.fetchurl` to
          download (and unpack) tarballs remotely.
          # See the real usage below.
          src = ...;
        }
      */

      mods = [
        {
          name = "Tankmod-Revived";
          subdirs = [ "Tankmod_Revived_BN" ];
          src = pinnedSources.mod-tankmod-revived.src;
        }

        {
          name = "Jackledead-Armory";
          subdirs = [
            "modsBrightNights/jackledead_armory"
            "modsBrightNights/jackledead_armory_expansion"
          ];
          src = pinnedSources.mod-jackledead-armory.src;
        }
      ];

      soundPacks = [ ];

      tileSets = [ ];
    };

    expanded = {
      mods = [ ] ++ extras.mods;
      soundPacks = [
        {
          name = "Otopack+ModsUpdates";
          subdirs = [ "Otopack+ModsUpdates" ];
          src = pinnedSources.soundpack-otopack.src;
        }
      ] ++ extras.soundPacks;
      tileSets = [ ] ++ extras.tileSets;
    };
  };
}
