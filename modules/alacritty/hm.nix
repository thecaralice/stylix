# Documentation is available at:
# - https://alacritty.org/config-alacritty.html
# - `man 5 alacritty`
{ config, lib, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;
  inherit (builtins) removeAttrs;
in
{
  options.stylix.targets.alacritty.enable = config.lib.stylix.mkEnableTarget "Alacritty" true;

  config = lib.mkIf (config.stylix.enable && config.stylix.targets.alacritty.enable) {
    programs.alacritty.settings = {
      font = with config.stylix.fonts; {
        normal = {
          family = monospace.name;
          style = "Regular";
        };
        size = sizes.terminal;
      };
      window.opacity = with config.stylix.opacity; terminal;
      colors = with colors; {
        primary = {
          foreground = base05;
          background = base00;
          bright_foreground = base07;
        };
        selection = {
          text = base05;
          background = base02;
        };
        cursor = {
          text = base00;
          cursor = base05;
        };
        normal = removeAttrs colors.ansi.dark ["toList"];
        bright = removeAttrs colors.ansi.bright ["toList"];
      };
    };
  };
}
