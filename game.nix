{
  stable = rec {
    version = "v0.6.0";
    archiveUrl =
      "https://github.com/cataclysmbnteam/Cataclysm-BN/releases/download/${version}/"
      + "cbn-linux-tiles-x64-${version}.tar.gz";
    hash = "sha256-hUXL/lWVY3C0zPi5nVgtvGst3N9H/j5GZxR73aao4cI=";
    description = "CBN GUI edition (tiles) for Linux x86_64";
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
          src = fetchGit {
            url = "https://github.com/chaosvolt/cdda-tankmod-revived-mod";
            rev = "11a52995bdbdd9bc5ec66b058a5aaef755f96691";
            shallow = true;
          };
        }

        {
          name = "Jackledead-Armory";
          subdirs = [
            "modsBrightNights/jackledead_armory"
            "modsBrightNights/jackledead_armory_expansion"
          ];
          src = fetchGit {
            url = "https://github.com/jackledead/jackledead_armory";
            rev = "ddb48de223839f7b61390d4e58fa506878624a30";
            shallow = true;
          };
        }
      ];

      soundPacks = [ ];

      tileSets = [ ];
    };
  };
}
