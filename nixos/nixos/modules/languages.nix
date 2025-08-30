{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    python313
    cargo
    lua
    go
    gcc
    rustc
  ];
}
