{
  config,
  pkgs,
  inputs,
  ...
}:
let
  marketplace = inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace;
in
{
  home.packages = with pkgs; [
    nixd
    nixfmt
  ];

  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with marketplace; [
          zhuangtongfa.material-theme
          jnoortheen.nix-ide
          alefragnani.project-manager
          jcs090218.ellsp
          christian-kohler.path-intellisense

        ];
        userSettings = {
          "chat.disableAIFeatures" = true;
          "workbench.colorTheme" = "One Dark Pro";
          "editor.formatOnSave" = true;
          "explorer.compactFolders" = false;

          "editor.minimap.autohide" = "mouseover";

          # NIX
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";

          "nix.serverSettings" = {
            "nixd" = {
              "formatting" = {
                "command" = [ "nixfmt" ];
              };
              "options" = {
                "nixos" = {
                  "expr" = "(builtins.getFlake \"/home/tomas/dotfiles\").nixosConfigurations.nixos.options";
                };
                "home-manager" = {
                  "expr" = "(builtins.getFlake \"/home/tomas/dotfiles\").homeConfigurations.\"tomas\".options";
                };
              };
            };
          };

        };
      };
    };

  };
}
