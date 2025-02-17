# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}:
{
  game-cbn-tiles-stable-prebuilt = {
    pname = "game-cbn-tiles-stable-prebuilt";
    version = "1454";
    src = fetchTarball {
      url = "https://github.com/cataclysmbnteam/Cataclysm-BN/releases/download/v0.7.0/cbn-linux-tiles-x64-v0.7.0.tar.gz";
      sha256 = "sha256-6r+LcowWp6SbL7NP+2ZgPz248hKJgQPdJNr/TRqS8io=";
    };
  };
  mod-jackledead-armory = {
    pname = "mod-jackledead-armory";
    version = "7262ba982a83f37cb1b12cac58e5f053a44a1833";
    src = fetchFromGitHub {
      owner = "jackledead";
      repo = "jackledead_armory";
      rev = "7262ba982a83f37cb1b12cac58e5f053a44a1833";
      fetchSubmodules = false;
      sha256 = "sha256-ta0JTM9asi+7CgdEM0KqjkqD2QQqkdTRbHTdwWthxB8=";
    };
    date = "2024-11-19";
  };
  mod-tankmod-revived = {
    pname = "mod-tankmod-revived";
    version = "8f656072e519be699e6a4caf78ca69451db6d290";
    src = fetchFromGitHub {
      owner = "chaosvolt";
      repo = "cdda-tankmod-revived-mod";
      rev = "8f656072e519be699e6a4caf78ca69451db6d290";
      fetchSubmodules = false;
      sha256 = "sha256-tf3yQbZo+s+yvet3I8on3e8RLswztSOOy1Uvi5Ha3/Y=";
    };
  };
  soundpack-otopack = {
    pname = "soundpack-otopack";
    version = "508da9f0e38ec996f14c930c58848024680ca2be";
    src = fetchFromGitHub {
      owner = "Kenan2000";
      repo = "Otopack-Mods-Updates";
      rev = "508da9f0e38ec996f14c930c58848024680ca2be";
      fetchSubmodules = false;
      sha256 = "sha256-t8MplRma2A2yVw9P8SU4rf7lt1dP2KWna7EQfakZ1Zg=";
    };
    date = "2024-08-10";
  };
}
