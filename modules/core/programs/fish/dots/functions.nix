{
  hm.programs.fish.functions = {
    mkcd = ''
      mkdir -p "$argv"
      and cd "$argv"
    '';

    bak = ''
      cp $argv $argv.bak
    '';
  };
}
