{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (config.lib.stylix.colors.withHashtag) base01 base02 base05;
  cfg = config.desktop.fcitx;
  font = "Noto Sans CJK JP 16";
  themeName = "base16";
in {
  options.desktop.fcitx.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    systemd.user.services."app-org.fcitx.Fcitx5@autostart".enable = false;
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-gtk
          fcitx5-mozc-ut
        ];
      };
    };

    hm.home.sessionVariables = {
      QT_IM_MODULE = "fcitx";
      # GTK_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
    };

    hm.xdg.dataFile = {
      "fcitx5/themes/${themeName}/theme.conf".text =
        # ini
        ''
          [Metadata]
          Name=${themeName}
          Version=0.1
          ScaleWithDPI=True

          [InputPanel]
          Font=${font}
          NormalColor=${base05}
          HighlightCandidateColor=${base05}
          HighlightColor=${base05}
          HighlightBackgroundColor=${base01}
          Spacing=6

          [InputPanel/TextMargin]
          Left=5
          Right=5
          Top=5
          Bottom=5

          [InputPanel/ContentMargin]
          Left=2
          Right=2
          Top=2
          Bottom=2

          [InputPanel/Background/Margin]
          Left=2
          Right=2
          Top=2
          Bottom=2

          [InputPanel/Background]
          Color=${base01}

          [InputPanel/Highlight]
          Color=${base02}

          [InputPanel/Highlight/Margin]
          Left=5
          Right=7
          Top=5
          Bottom=5

          [Menu]
          NormalColor=${base01}

          [Menu/Background]
          Color=${base01}

          [Menu/Highlight]
          Color=${base02}

          [Menu/Separator]
          Color=${base02}

          [Menu/Background/Margin]
          Left=2
          Right=2
          Top=2
          Bottom=2

          [Menu/ContentMargin]
          Left=2
          Right=2
          Top=2
          Bottom=2

          [Menu/Highlight/Margin]
          Left=5
          Right=5
          Top=5
          Bottom=5

          [Menu/TextMargin]
          Left=5
          Right=5
          Top=5
          Bottom=5
        '';
    };

    hm.xdg.configFile = {
      "mozc/ibus_config.textproto" = {
        force = true;
        text =
          # textproto
          ''
            engines {
            name : "mozc-jp"
            longname : "Mozc"
            layout : "default"
            layout_variant : ""
            layout_option : ""
            rank : 80
            }
            active_on_launch: True
          '';
      };

      "fcitx5/config" = {
        force = true;
        text =
          # ini
          ''
            [Hotkey]
            EnumerateWithTriggerKeys=True
            AltTriggerKeys=
            EnumerateForwardKeys=
            EnumerateBackwardKeys=
            EnumerateSkipFirst=False
            EnumerateGroupForwardKeys=
            EnumerateGroupBackwardKeys=
            ActivateKeys=
            DeactivateKeys=

            [Hotkey/TriggerKeys]
            0=Control+space

            [Hotkey/PrevPage]
            0=Up

            [Hotkey/NextPage]
            0=Down

            [Hotkey/PrevCandidate]
            0=Shift+Tab

            [Hotkey/NextCandidate]
            0=Tab

            [Hotkey/TogglePreedit]
            0=Control+Alt+P

            [Behavior]
            ActiveByDefault=False
            ShareInputState=No
            PreeditEnabledByDefault=True
            ShowInputMethodInformation=True
            showInputMethodInformationWhenFocusIn=False
            CompactInputMethodInformation=True
            ShowFirstInputMethodInformation=True
            DefaultPageSize=5
            OverrideXkbOption=False
            CustomXkbOption=
            EnabledAddons=
            DisabledAddons=
            PreloadInputMethod=True
          '';
      };

      "fcitx5/profile" = {
        force = true;
        text =
          # ini
          ''
            [Groups/0]
            Name="Group 1"
            Default Layout=us
            DefaultIM=mozc

            [Groups/0/Items/0]
            Name=keyboard-us
            Layout=

            [Groups/0/Items/1]
            Name=mozc
            Layout=

            [GroupOrder]
            0="Group 1"
          '';
      };

      "fcitx5/conf/classicui.conf" = {
        force = true;
        text =
          # ini
          ''
            Vertical Candidate List=False
            PerScreenDPI=True
            WheelForPaging=True
            Font="${font}"
            MenuFont="${font}"
            TrayFont="${font}"
            TrayOutlineColor=${base02}
            TrayTextColor=${base05}
            PreferTextIcon=False
            ShowLayoutNameInIcon=True
            UseInputMethodLangaugeToDisplayText=True
            Theme=${themeName}
          '';
      };

      "fcitx5/conf/clipboard.conf" = {
        force = true;
        text =
          # ini
          ''
            TriggerKey=
            PastePrimaryKey=
            Number of entries=5
          '';
      };

      "fcitx5/conf/mozc.conf" = {
        force = true;
        text =
          # ini
          ''
            InitialMode=Hiragana
            Vertical=True
            ExpandMode="On Focus"
            PreeditCursorPositionAtBeginning=False
            ExpandKey=Control+Alt+H
          '';
      };

      "fcitx5/conf/notifications.conf" = {
        force = true;
        text = "HiddenNotifications=";
      };

      "fcitx5/conf/unicode.conf" = {
        force = true;
        text = "TriggerKey=";
      };

      "fcitx5/conf/quickphrase.conf" = {
        force = true;
        text = "TriggerKey=";
      };
    };
  };
}
