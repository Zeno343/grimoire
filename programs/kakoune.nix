{ ... }: {
  programs.kakoune = {
    enable = true;
    config.hooks = [{
      name = "WinSetOption";
      option = "filetype=markdown";
      commands = ''
        add-highlighter window/ regex ^#+\s+([^\n]*) 0:red 1:white,red
      '';
    }];
  };
}
