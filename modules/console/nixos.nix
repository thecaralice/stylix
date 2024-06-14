{ config, lib, ... }:

with config.lib.stylix.colors;

{
  options.stylix.targets.console.enable =
    config.lib.stylix.mkEnableTarget "the Linux kernel console" true;

  config.console.colors = lib.mkIf (config.stylix.enable && config.stylix.targets.console.enable) ansi.toList;
}
