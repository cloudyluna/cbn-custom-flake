{
  pkgs,
  lib,
  pinnedSources,
}:
{
  game = import ./game.nix { inherit pkgs lib pinnedSources; };
  contentsInstaller = import ./library/contents-installer.nix { inherit pkgs lib; };
  devshell = import ./utility/devshell.nix { inherit pkgs lib; };
}
