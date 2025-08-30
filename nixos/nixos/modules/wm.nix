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

  security.pam.services.gtklock = {};
}
