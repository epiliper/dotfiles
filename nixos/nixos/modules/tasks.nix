{
  libs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    typst
    libreoffice
    websocat
  ];
}
