{
  pkgs,
  ...
}:
{
  stylix = {
    enable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  };
}
