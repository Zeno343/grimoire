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
              imports = [ ../programs/neovim.nix ];
              home = {
                stateVersion = "23.05";
              };

              programs = {
                home-manager.enable = true;
                kakoune = {
                  enable = true;
                  config.hooks = [{
	            name = "WinSetOption";
	            option = "filetype=markdown";
	            commands =
	              ''add-highlighter window/ regex ^#+\s+([^\n]*) 0:red 1:white,red'';
	            }];
                };

                kitty = {
                  enable = true;
                  font = {
                    package = pkgs.hack-font;
                    name = "Hack";
	            size = 13;
                  };
                  extraConfig = with import ../colors/noirblaze.nix; ''
                    color0  ${black}
                    color1  ${red}
                    color2  ${green}
                    color3  ${yellow}
                    color4  ${blue}
                    color5  ${magenta}
                    color6  ${cyan}
                    color7  ${white}
                    color8  ${gray}
                    color9  ${brightRed}
                    color10 ${brightGreen}
                    color11 ${brightYellow}
                    color12 ${brightBlue}
                    color13 ${brightMagenta}
                    color14 ${brightCyan}
                    color15 ${brightWhite}
                  '';
                };

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

              xsession.windowManager.i3 = {
                enable = true;
                config.keybindings = {
                  "Mod4 + Return" = "exec kitty";
                  "Mod4 + Shift + q" = "kill";

                  "Mod4 + 0" = "workspace number 0";
                  "Mod4 + 1" = "workspace number 1";
                  "Mod4 + 2" = "workspace number 2";
                  "Mod4 + 3" = "workspace number 3";
                  "Mod4 + 4" = "workspace number 4";
                  "Mod4 + 5" = "workspace number 5";
                  "Mod4 + 6" = "workspace number 6";
                  "Mod4 + 7" = "workspace number 7";
                  "Mod4 + 8" = "workspace number 8";
                  "Mod4 + 9" = "workspace number 9";

                  "Mod4 Shift + 0" = "move container to workspace number 0";
                  "Mod4 Shift + 1" = "move container to workspace number 1";
                  "Mod4 Shift + 2" = "move container to workspace number 2";
                  "Mod4 Shift + 3" = "move container to workspace number 3";
                  "Mod4 Shift + 4" = "move container to workspace number 4";
                  "Mod4 Shift + 5" = "move container to workspace number 5";
                  "Mod4 Shift + 6" = "move container to workspace number 6";
                  "Mod4 Shift + 7" = "move container to workspace number 7";
                  "Mod4 Shift + 8" = "move container to workspace number 8";
                  "Mod4 Shift + 9" = "move container to workspace number 9";

                  "Mod4 + h" = "focus left";
                  "Mod4 + j" = "focus down";
                  "Mod4 + k" = "focus up";
                  "Mod4 + l" = "focus right";

                  "Mod4 + Shift + h" = "move left";
                  "Mod4 + Shift + j" = "move down";
                  "Mod4 + Shift + k" = "move up";
                  "Mod4 + Shift + l" = "move right";
                };
              };
            };
        };
}];
}
