{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    tmux
    fzf
    gnumake
    libclang
    vim
    neovim
  ];
}
