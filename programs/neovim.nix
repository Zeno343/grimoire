{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      { plugin = iceberg-vim;
        config = "colorscheme iceberg";
      }
      { plugin = vimwiki;
        config = ''
          let g:vimwiki_list = [{
	  \  'path': '~/',
          \  'index': 'todo',
          \  'syntax': 'markdown',
          \  'ext': 'md' }]
        '';
      }
    ];
  };
}

