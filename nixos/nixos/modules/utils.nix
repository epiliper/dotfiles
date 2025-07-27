{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    fastfetch
    stow
    (pass.withExtensions (ext: [ext.pass-import]))
    pass
    ddcutil
    wlsunset
    unzip
    ripgrep
    samtools
    (flameshot.override { enableWlrSupport = true; })
  ];
}
