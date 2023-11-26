{ pkgs, ... }: {
  programs.kitty = {
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
}

