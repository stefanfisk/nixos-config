{ lib, pkgs, ... }:

with lib; {
  users.users.stefanfisk = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.stefanfisk = {
    home.packages = with pkgs; [
      pkgs.nodejs
      pkgs.nixpkgs-fmt
      pkgs.firefox
    ];
  };
}
