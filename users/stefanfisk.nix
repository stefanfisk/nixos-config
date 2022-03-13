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

    programs.git = {
      enable = true;

      userName = "Stefan fisk";
      userEmail = "contact@stefanfisk.com";

      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}
