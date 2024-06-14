{ config, lib, ... }:

{
  options.stylix.targets.xresources.enable =
    config.lib.stylix.mkEnableTarget "Xresources" true;

  config = lib.mkIf (config.stylix.enable && config.stylix.targets.xresources.enable) {
    xresources.properties = with config.lib.stylix.colors.withHashtag; with config.stylix.fonts; {
      "*.faceName" = monospace.name;
      "*.faceSize" = sizes.terminal;
      "*.renderFont" = true;
      "*foreground" = base05;
      "*background" = base00;
      "*cursorColor" = base05;
    }
    // lib.listToAttrs (lib.imap0 (i: lib.nameValuePair "*color${toString i}") ansi.toList);
  };
}
