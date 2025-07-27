{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    tmux
    fzf
    alacritty
    gnumake
    libclang
    clang
    vim
    neovim
    htslib
  ];
}
