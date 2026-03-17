{ pkgs, ... }:
{
  environment.packages = [
  ];
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "nix-on-droid";
    userEmail = "nix-on-droid@nullring.xyz";
    lfs = {
      enable = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      la = "ls -a";
      c = "clear";
      g = "git";
      gp = "git pull origin main";
      gu = "git push origin main";
      gc = "git commit -m";
      gi = "git lfs install";
      rb = "nix-on-droid switch --flake $HOME/agility#agility";
    };
  };

  home.stateVersion = "24.05";
}
