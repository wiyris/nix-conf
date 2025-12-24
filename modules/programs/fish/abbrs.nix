{
  programs.fish = {
    shellAbbrs = {
      k = "killall";
      kn = "killall -9";
      xx = "7z";
      yt = "yt-dlp";
      sc = "scdl";
      dr = "tldr";

      us = "systemctl --user";
      ds = "sudo systemctl";

      bc = "bluetoothctl connect";
      bd = "bluetoothctl disconnect";
      vol = "wpctl set-volume '@DEFAULT_AUDIO_SINK@'";

      mc = "mullvad connect";
      md = "mullvad disconnect";
      mr = "mullvad reconnect";
      ms = "mullvad status";

      nf = "nix flake";
      nfc = "nix flake check";
      nfu = "nix flake update";
      npr = "nixpkgs-review pr --run fish --print-result";
      nd = "nix develop --command fish";
      nb = "nix build";
      ns = "nix shell";
      nr = "nix run";
      ncg = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
      nvd = "nvd --color always diff /run/current-system result | rg -v 0.0.0 | less -R";
      sw = "nh os switch --ask";

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
      gp = "git pull";
      gP = "git push";
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

    functions.mullvad-init = ''
      mullvad auto-connect set on
      mullvad lan set allow
      mullvad relay set location jp
      mullvad lockdown-mode set on
    '';
  };
}
