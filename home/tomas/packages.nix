{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    codegrab
  ];
}
