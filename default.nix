{ pkgs, lib }:
{
  game = import ./game.nix;
  contentsInstaller = import ./library/contents-installer.nix { inherit pkgs lib; };
  devshell = import ./utility/devshell.nix { inherit pkgs lib; };
}
