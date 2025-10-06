{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.hardware'.amdgpu;
in {
  options.hardware'.amdgpu.enable = lib.mkEnableOption {};
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

      nvtopPackages.amd
      amdgpu_top
    ];

    hardware.amdgpu = {
      initrd.enable = true; # Can fix lower resolution in boot screen during initramfs phase
    };

    environment.variables = {
      VDPAU_DRIVER = "radeonsi";
    };
  };
}
