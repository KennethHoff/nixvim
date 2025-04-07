{ lib, pkgs, ... }:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "roslyn";
  packPathName = "roslyn.nvim";
  package = "roslyn-nvim";

  maintainers = [ lib.maintainers.GaetanLepage ];

  extraConfig = cfg: {
    extraPlugins = [ pkgs.vimPlugins.roslyn-nvim ];
    extraConfigLua = ''
      require('roslyn').setup({
        -- roslyn-ls adds this command
        exe = 'Microsoft.CodeAnalysis.LanguageServer'
      })
    '';
  };

  # home.packages = [ pkgs.roslyn-ls ];
}
