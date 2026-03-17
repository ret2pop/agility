{ pkgs, ... }:
{
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
      gP = "git push origin main";
      gc = "git add . && git commit -m \"commit from phone\"";
      gi = "git lfs install";
      gs = "git status -sb";
      a = "cd ~/agility";
      au = "cd ~/agility && git pull origin main && nix-on-droid switch --flake .#agility";
      m = "cd ~/monorepo";
      mu = "cd ~/monorepo && git pull origin main";
      mb = "cd ~/monorepo && git checkout -b \"nix-on-droid-branch\"";
      md = "cd ~/monorepo && git branch -d \"nix-on-droid-branch\"";
      rb = "nix-on-droid switch --flake $HOME/agility#agility";
    };
  };

  home.stateVersion = "24.05";
}
