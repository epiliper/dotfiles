{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking
  networking.hostName = "bippy"; 
  networking.networkmanager.enable = true;

  # timezone
  time.timeZone = "America/Los_Angeles";

  # bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; services.blueman.enable = true;

  # display
  hardware.i2c.enable = true;

  # sound
  hardware.pulseaudio.enable = true;
  services.pipewire.enable = false;

  services.deluge = {
    enable = true;
    web.enable = true;
  };

  users.users.eli = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.bash;
    home = "/home/eli";
  };

  environment.systemPackages = with pkgs; [
    alacritty
    zathura
    inputs.zen-browser.packages."${pkgs.system}".twilight
  ];

  security.pam.services.gtklock = {};

  fonts.packages = with pkgs; [
  	(nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

  # sway config
  programs.sway = {
	  enable = true;
	  wrapperFeatures.gtk = true;

  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  system.stateVersion = "24.11"; # Did you read the comment?

}

