{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/home-manager.nix
      ../../modules/vscode-server.nix
      ../../users/stefanfisk.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "virtualbox";

  time.timeZone = "Europe/Stockholm";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull
    psmisc
    vim
    wget
  ];

  security.sudo.wheelNeedsPassword = false;

  services.openssh.enable = true;

  programs.ssh.startAgent = true;

  system.stateVersion = "21.11";
}
