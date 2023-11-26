{ config, pkgs, ... }: { 
  system.stateVersion = "23.05"; 
  imports = [ ./hardware-configuration.nix ];

  programs = {
    firefox.enable = true;
  };

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    xserver = {
      windowManager.i3.enable = true;
      enable = true;
    };

    tlp.enable = true;
  };

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
    ];
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "envy";
    networkmanager.enable = true;
    extraHosts = ''
       100.26.93.2 bastion
    '';
  };
  
  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.settings = {
   experimental-features = [
     "nix-command"
     "flakes"
     ];
  };

  time.timeZone = "America/New_York";
}
