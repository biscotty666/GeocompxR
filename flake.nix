{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.systems.url = "github:nix-systems/default";
  inputs.flake-utils = {
    url = "github:numtide/flake-utils";
    inputs.systems.follows = "systems";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [ pkgs.bashInteractive ];
          buildInputs = with pkgs; [
            R
            rPackages.pagedown
            rPackages.tidyverse
            rPackages.sf
            rPackages.terra
            rPackages.leaflet
            rPackages.XML
            rPackages.rnaturalearth
            rPackages.rnaturalearthdata
            rPackages.osmdata
            rPackages.lwgeom
            rPackages.rmapshaper
            rPackages.rcartocolor
            rPackages.shiny
            rPackages.mapview
            rPackages.mapdeck
            rPackages.ggspatial
            rPackages.cartogram
#            rPackages.USAboundaries
            rPackages.gifski
            rPackages.historydata
            rPackages.viridis
#            rPackages.tmap
            rPackages.spData
            rPackages.codetools
            chromium
            pandoc
            texlive.combined.scheme-full
            rstudio
          ];
        };
      }
    );
}
