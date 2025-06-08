{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Language Servers
    nixd
    lua-language-server
    # formatters
    nixfmt-rfc-style
    stylua
  ];

  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        userSettings = {
          workbench = {
            colorTheme = "One Dark Pro";
          };
          editor = {
            fontFamily = "FiraCode Nerd Font Mono";
            formatOnSave = true;
          };
          nix = {
            serverPath = "${pkgs.nixd}/bin/nixd";
            enableLanguageServer = true;
          };
          nixd = {
            formatting = {
              command = "nixfmt";
            };
            options = {
              nixos = "(builtins.getFlake \"/home/$USER/dotfiles/nixos\").nixosConfigurations.$HOST.options";
            };
          };
        };
        extensions = with pkgs.vscode-marketplace; [
          jnoortheen.nix-ide
          zhuangtongfa.material-theme
        ];
      };
    };
  };
}
