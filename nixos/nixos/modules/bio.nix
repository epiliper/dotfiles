{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    samtools
  ];
}
