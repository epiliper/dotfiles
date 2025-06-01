{
lib,
pkgs,
...
}: {
  environment.systemPackages = with pkgs; [
    rust-analyzer
    lua-language-server
    basedpyright
    clang
    tinymist
  ];
}
