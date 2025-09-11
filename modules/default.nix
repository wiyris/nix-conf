{lib, ...}: {
  imports =
    builtins.attrValues (lib.defaultFilesToAttrset ./core)
    ++ builtins.attrValues (lib.defaultFilesToAttrset ./desktop);
}
