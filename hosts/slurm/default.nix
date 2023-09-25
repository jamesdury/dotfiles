{ pkgs, config, lib, ... }: {

  imports = [

    ./configuration.nix
    ./hardware-configuration.nix
    ../home.nix

  ];
}

