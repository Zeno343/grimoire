{ config, pkgs, home-manager, ... }: {
  users.users.zeno = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };

  imports = [
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
            users.zeno = {
              home = {
                stateVersion = "23.05";
              };
              imports = [
                ../programs/neovim.nix
                ../programs/kakoune.nix
                ../programs/kitty.nix
                ../programs/i3.nix
              ];

              programs = {
                home-manager.enable = true;
                firefox = {
                  enable = true;
                  profiles.default.settings = {
                    "browser.download.dir" = "/home/zeno/documents/Downloads";
                  };
                };

                git = {
                  enable = true;
                  userName = "zeno";
                  userEmail = "zacheryklinglesmith@gmail.com";
                  extraConfig = {
                    core = {
	              editor = "nvim";
	            };
                  };
                };
              };
           };
        };
}];
}
