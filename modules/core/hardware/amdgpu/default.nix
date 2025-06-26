{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.custom.hardware.amdgpu;
in {
  options.custom.hardware.amdgpu.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.xserver.videoDrivers = ["amdgpu"];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libvdpau-va-gl # VA-API to VDPAU wrapper
        vaapiVdpau # VDPAU to VA-API wrapper
      ];
    };

    environment.systemPackages = with pkgs; [
      vulkan-tools
      vulkan-validation-layers
    ];

    hardware.amdgpu = {
      initrd.enable = true; # Can fix lower resolution in boot screen during initramfs phase
      # amdvlk = {
      #   enable = true;
      #   support32Bit.enable = true;
      # };
    };

    environment.variables = {
      VDPAU_DRIVER = "radeonsi";
    };
  };
}
