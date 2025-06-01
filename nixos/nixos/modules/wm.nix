{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    swayidle
    swaybg
    waybar

    mako
    wofi
    gtklock

    pavucontrol
    lsd
    wl-clipboard
    zoxide
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

  security.pam.services.gtklock = {};
}
