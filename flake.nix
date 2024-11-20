{
  description = ''
    cbb-custom-flake: A nix flake to install pre-built CBN games bundled
    with my preferred modifications and patches.
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    let
      supportedSystems = [ "x86_64-linux" ];
    in
    flake-utils.lib.eachSystem supportedSystems (
      system:
      let
        prelude = import ./default.nix { inherit pkgs lib; };
        pkgs = import nixpkgs { inherit system; };
        lib = pkgs.lib;
        module = import ./default.nix { inherit pkgs lib; };
      in
      rec {
        packages = rec {

          # With extra mods and all the goodies I like.
          extras = default.overrideAttrs (
            let
              extraContents = module.game.stable.extras;
            in
            {
              prePatch = (module.contentsInstaller.installExtraContents extraContents ".");
              patchFlags = [
                "-p1"
                "-d"
                "data/mods"
              ];
              patches = [ ];
            }
          );

          development = default.overrideAttrs (
            let
              launcherFile = "cbn-tiles-launcher-development";
              jsonFormatterFile = "json_formatter.cgi";
              developmentUserDir = ".cbn-custom-development";

              writeLauncherScript = ''
                cat << EOF > launcher

                #!${pkgs.runtimeShell}

                if [[ -z "\$1" ]]; then
                    userdir="\$HOME/${developmentUserDir}"
                else
                    userdir="\$1"
                fi

                content_dir="\$userdir/content"
                if [[ ! -d "\$content_dir" ]]; then
                    mkdir -p "\$content_dir"
                    cp --no-preserve=mode -R $out/data $out/gfx $out/share/doc "\$content_dir/"
                fi

                "$out/bin/cataclysm-tiles" --basepath "\$content_dir" --userdir "\$userdir"

                EOF

                install -m755 -D launcher $out/bin/${launcherFile}
              '';
            in
            previousAttrs: rec {
              name = launcherFile;
              pname = "development";
              meta.mainProgram = launcherFile;
              nativeBuildInputs = previousAttrs.nativeBuildInputs ++ [ pkgs.stdenv.cc.cc ];
              installPhase = ''
                runHook preInstall

                mkdir $out

                install -m755 -D ${jsonFormatterFile} $out/bin/${jsonFormatterFile}

                mkdir -p $out
                cp -R data gfx doc $out

                install -m755 -D cataclysm-tiles $out/bin/cataclysm-tiles

                ${writeLauncherScript}

                runHook postInstall
              '';
            }
          );

          default =
            let
              game = module.game;
              writeLauncherScript = ''
                cat << EOF > launcher

                #!${pkgs.runtimeShell}

                if [[ -z "\$1" ]]; then
                    userdir="\$HOME/.cbn-custom"
                else
                    userdir="\$1"
                fi

                $out/bin/cataclysm-tiles --basepath $out --userdir "\$userdir"

                EOF

                install -m755 -D launcher $out/bin/cbn-tiles-launcher
              '';

              makeInstallPhase = ''
                runHook preInstall

                mkdir -p $out
                cp -R data gfx doc $out

                install -m755 -D cataclysm-tiles $out/bin/cataclysm-tiles

                ${writeLauncherScript}

                runHook postInstall
              '';
            in
            pkgs.stdenvNoCC.mkDerivation {
              name = "cbn-tiles-launcher";
              version = game.stable.version;
              src = pkgs.fetchurl {
                url = game.stable.archiveUrl;
                hash = game.stable.hash;
              };

              nativeBuildInputs = with pkgs; [ autoPatchelfHook ];

              buildInputs = with pkgs; [
                SDL2
                SDL2_image
                SDL2_mixer
                SDL2_ttf
              ];

              dontConfigure = true;
              dontBuild = true;
              dontStrip = true;

              installPhase = makeInstallPhase;
            };
        };

        devShells.default = module.devshell;
      }
    );
}
