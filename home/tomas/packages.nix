{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    codegrab
    wl-clipboard
  ];
}
