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

    programs.bash = {
      enable = true;

      profileExtra = ''
        GIT_PS1_SHOWDIRTYSTATE=1
        GIT_PS1_SHOWSTASHSTATE=true
        GIT_PS1_SHOWUPSTREAM="auto"
        GIT_PS1_SHOWCOLORHINTS=1

        source ${pkgs.gitAndTools.gitFull}/share/git/contrib/completion/git-prompt.sh

        PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
      '';
    };

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
