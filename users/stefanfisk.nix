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

        grey='\[\033[1;30m\]'
        red='\[\033[0;31m\]'
        RED='\[\033[1;31m\]'
        green='\[\033[0;32m\]'
        GREEN='\[\033[1;32m\]'
        yellow='\[\033[0;33m\]'
        YELLOW='\[\033[1;33m\]'
        purple='\[\033[0;35m\]'
        PURPLE='\[\033[1;35m\]'
        white='\[\033[0;37m\]'
        WHITE='\[\033[1;37m\]'
        blue='\[\033[0;34m\]'
        BLUE='\[\033[1;34m\]'
        cyan='\[\033[0;36m\]'
        CYAN='\[\033[1;36m\]'
        NC='\[\033[0m\]'

        PROMPT_COMMAND='__git_ps1 "$green\u$NC@$yellow\h $cyan\w$NC" "\\\$ "'
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
