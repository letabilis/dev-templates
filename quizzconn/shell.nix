let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs {
    config = { allowUnfree = true; };
    overlays = [];
  };
in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    python3Minimal
    ngrok
    poetry
    docker
    docker-compose
  ];
}
