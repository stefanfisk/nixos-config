{
  imports = [
    (fetchTarball "https://github.com/msteen/nixos-vscode-server/tarball/master")
  ];

  services.vscode-server.enable = true;

  systemd.user.services.vscoder-server.enable = true;
}
