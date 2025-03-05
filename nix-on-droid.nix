{ config, lib, pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    vim # or some other editor, e.g. nano or neovim
    tmux
    rsync
    # Some common stuff that people expect to have
    #procps
    openssh
    killall
    #diffutils
    #findutils
    #utillinux
    #tzdata
    curl
    unixtools.ping
    cmatrix
    nmap
    ncurses
    hostname
    htop
    man
    gnugrep
    gnupg
    gnused
    gnutar
    git
    bzip2
    gzip
    xz
    zip
    unzip
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  time.timeZone = "America/Vancouver";
}
