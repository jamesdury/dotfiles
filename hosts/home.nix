{ inputs, config, lib, pkgs, ... }:

{
  imports = [ ../default.nix ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.ceephax = {
    home.stateVersion = "23.05"; # Please read the comment before changing.
    home.packages = with pkgs; [ terraform nixfmt wget curl git ];
    programs.home-manager.enable = true;

  };
  programs = {
    zsh = {
      enable = true;
      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "git" ];
      };
    };
  };

  users.users.ceephax.shell = pkgs.zsh;
  users.users.ceephax.group = "user";
  users.users.ceephax.isNormalUser = true;

}

