{ pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    vim
    tmux
    rsync
    emacs
    openssh
    killall
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
    bzip2
    gzip
    xz
    zip
    unzip
  ];

  user.shell = "${pkgs.zsh}/bin/zsh";
  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  home-manager.config = ./home.nix;

  # Set your time zone
  time.timeZone = "America/Vancouver";
}
