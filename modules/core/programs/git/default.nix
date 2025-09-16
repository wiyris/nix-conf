{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.git;
  inherit (config.globals) homeDirectory;
in {
  options.programs'.git.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      programs.gh = {
        enable = true;
        settings = {
          git_protocol = "ssh";
          prompt = "enabled";
        };
        hosts = {
        };
      };
      # programs.ssh = {
      #   enable = true;
      #   addKeysToAgent = "yes";
      # };
      programs.git = {
        enable = true;
        userName = "wiyris";
        userEmail = "c8b5805d-928f-4c0b-8fc0-27817abedf44@passmail.com";
        signing = {
          format = "ssh";
          key = "${homeDirectory}/.ssh/id_ed25519";
          signByDefault = true;
        };
        extraConfig = {
          color.ui = true;
          init.defaultBranch = "main";
        };
        delta = {
          enable = true;
          options = {
            diff-so-fancy = true;
            line-numbers = true;
            true-color = "always";
          };
        };
      };

      # Yet another Git TUI (written in rust).
      programs.gitui.enable = true;

      programs.fish.shellAbbrs = {
        g = "git";
        ga = "git add";
        gaa = "git add --all";
        gap = "git add --patch";
        gapp = "git apply";
        gb = "git branch --verbose";
        gbr = "git branch --verbose --remotes";
        gbd = "git branch --delete";
        gbD = "git branch --delete --force";
        gc = "git commit -m";
        gca = "git commit --amend";
        gcl = "git clone";
        gco = "git checkout";
        gcot = "git checkout --theirs";
        gcp = "git cherry-pick --strategy-option theirs";
        gcpx = "git cherry-pick --strategy-option theirs -x";
        gd = "git diff";
        gds = "git diff --staged";
        gf = "git fetch";
        gi = "git init";
        gl = "git log --oneline --decorate --graph -n 10";
        gm = "git merge";
        gp = "git push";
        gpu = "git pull";
        gr = "git reset HEAD~";
        gR = "git restore";
        gRs = "git restore --staged";
        gra = "git remote add";
        gre = "git remote --verbose";
        grh = "git reset HEAD";
        grr = "git reset --hard HEAD~";
        grb = "git rebase --interactive";
        grbc = "git rebase --continue";
        gs = "git status";
        gsma = "git submodule add";
        gsmu = "git submodule update --init --remote --recursive";
        gst = "git stash";
        gstp = "git stash pop";
        gsw = "git switch";
        gt = "git tag";
        gts = "git tag -s";
      };
    };
  };
}
