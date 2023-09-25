{ inputs, lib, pkgs, ... }:
let pkgs = import <nixpkgs> { };
in pkgs.lib.strings.toUpper
