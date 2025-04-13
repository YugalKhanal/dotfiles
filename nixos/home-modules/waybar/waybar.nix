{ config, ... }:

{
  programs.waybar = {
    enable = true;
    # Use default package
    # package = null;

    # Systemd integration
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };

    # Configuration from your JSON files
    settings = {
      mainBar = {
        "layer" = "top";
        "position" = "top";
        "spacing" = 6;
        "margin" = "4px 5px";
        "exclusive" = true;
        "fixed-center" = true;
        "modules-left" = [ "custom/launcher" "wlr/taskbar" "hyprland/window" ];
        "modules-center" = [ "hyprland/workspaces" ];
        "modules-right" = [
          "custom/notification"
          "group/systray"
          "clock"
          "group/hardware-info"
        ];

        # Module configuration
        "hyprland/workspaces" = {
          "active-only" = false;
          "format" = "{name}";
        };

        "hyprland/window" = {
          "rewrite" = {
            "(.*) - Brave" = "$1";
            "(.*) - Chromium" = "$1";
            "(.*) - Brave Search" = "$1";
            "(.*) - Outlook" = "$1";
            "(.*) Microsoft Teams" = "$1";
          };
          "separate-outputs" = true;
        };

        "clock" = {
          "format" = "{:%R 󰃭 %d·%m·%y}";
          "rotate" = 0;
          "tooltip-format" = "<span>{calendar}</span>";
          "calendar" = {
            "mode" = "month";
            "mode-mon-col" = 3;
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b>{}</b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };

        "custom/power" = {
          "format" = "&#x23FB;";
          "tooltip" = true;
          "on-click" = "wlogout -b 4";
        };

        "pulseaudio" = {
          "format" = "{icon} {volume}% ";
          "format-bluetooth" = "{icon}  {volume}%";
          "format-bluetooth-muted" = " {icon}  ";
          "format-muted" = " ";
          "format-source" = " {volume}%";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "󱠰";
            "headset" = "󰋎";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          "on-click" = "pulsecontrol";
          "on-click-right" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        };

        "bluetooth" = {
          "format" = " {status}";
          "on-click" = "rofi-bluetooth";
          "format-connected" = " {device_alias}";
          "format-connected-battery" = " {device_alias} {device_battery_percentage}%";
          "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        };

        "network" = {
          "tooltip" = true;
          "format-wifi" = "  {essid}";
          "rotate" = 0;
          "format-ethernet" = "󰈀";
          "tooltip-format" = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
          "format-linked" = "󰈀 {ifname} (No IP)";
          "format-disconnected" = "󰖪 ";
          "tooltip-format-disconnected" = "Disconnected";
          "interval" = 2;
          "on-click" = "nm-connection-editor";
        };

        "cpu" = {
          "format" = " {}%  ";
          "on-click" = "ghostty -e btop";
        };

        "memory" = {
          "format" = "{}%  ";
          "on-click" = "ghostty -e btop";
        };

        "disk" = {
          "interval" = 30;
          "format" = "{percentage_used}% ";
          "path" = "/";
          "on-click" = "ghostty -e btop";
        };

        "tray" = {
          "icon-size" = 18;
          "spacing" = 5;
        };

        "custom/media" = {
          "format" = "{icon}  <span>{}</span>";
          "return-type" = "json";
          "max-length" = 20;
          "exec" = "playerctl -a metadata --format '{\"text\": \"{{artist}} ~ {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          "on-click" = "playerctl play-pause";
          "on-click-right" = "playerctl next";
          "on-click-middle" = "playerctl previous";

          "format-icons" = {
            "Paused" = "";
            "Playing" = "";
          };
        };

        "custom/launcher" = {
          "format" = "󰀻";
          "on-click" = "rofi -show drun -show-icons";
          "tooltip-format" = "Open the application launcher.";
          "tooltip" = false;
        };

        "wlr/taskbar" = {
          "icon-size" = 24;
          "icon-theme" = "BeautyLine";
          "tooltip-format" = "{name}";
          "on-click" = "activate";
          "on-click-middle" = "close";
          "ignore-list" = [ "kitty-bg" "kitty-update" "kitty-install" ];
        };

        "custom/notification" = {
          "format" = " {}";
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "swaync-client -t -sw";
          "on-click-right" = "swaync-client -d -sw";
          "escape" = true;
        };

        "custom/nightmode" = {
          "format" = "{}";
          "interval" = 5;
          "exec" = "pgrep -x wlsunset > /dev/null && echo 'Night Mode: ON' || echo 'Night Mode: OFF'";
          "on-click" = "~/dotfiles/nixos/home-modules/waybar/redshift.sh";
        };

        # Group configurations
        "group/systray" = {
          "orientation" = "horizontal";
          "modules" = [ "custom/media" "pulseaudio" "network" "tray" "bluetooth" "custom/nightmode" ];
        };

        "group/hardware-info" = {
          "orientation" = "horizontal";
          "modules" = [ "cpu" "memory" "disk" "custom/power" ];
        };
      };
    };

    # Your CSS styling
    style = ''
      * {
        font-family: "JetBrainsMono NF ExtraBold";
        font-size: 13px;
      }

      window#waybar {
        background-color: rgba(25, 23, 36, 0);
        border-radius: 20px;
        color: rgba(224, 222, 244, 1);
        transition-property: background-color;
        transition-duration: 0.5s;
      }

      #hardware-info,
      #disk,
      #temperature,
      #network,
      #bluetooth,
      #bluetooth.on,
      #custom-media,
      #custom-nightmode,
      #wireplumber,
      #mode,
      #idle_inhibitor,
      #hyprland-window,
      #scratchpad,
      #systray,
      #mpd {
        padding: 0px 8px;
        color: rgba(235, 111, 146, 1);
        border-radius: 20px;
        background-color: rgba(25, 23, 36, 0.75);
        margin-left: 10px;
      }

      @keyframes blink-workspace {
        to {
          color: rgba(224, 222, 244, 0.7);
          font-weight: 800;
        }
      }

      #workspaces,
      #taskbar,
      #window {
        color: rgba(224, 222, 244, 1);
        margin-right: 10px;
        border-radius: 20px;
        background-color: rgba(25, 23, 36, 0.75);
        transition: all 0.4s ease-out;
      }

      #window {
        padding-left: 7px;
        padding-right: 7px;
        color: rgba(156, 207, 216, 1);
      }

      #taskbar button,
      #workspaces button {
        border-radius: 20px;
        border: none;
        color: rgba(224, 222, 244, 1);
        transition: all 0.4s ease-out;
      }

      #taskbar button.active,
      #workspaces button.active {
        background-color: rgba(49, 116, 143, 0.7);
        color: rgba(224, 222, 244, 1);
        animation-name: blink-workspace;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: 2;
        animation-direction: alternate;
      }

      #workspaces button.urgent {
        color: rgba(235, 111, 146, 0.5);
        font-weight: 800;
        animation-name: blink-workspace;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #workspaces button.empty {
        color: rgba(156, 207, 216, 1);
        animation-name: blink-workspace;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: 4;
        animation-direction: alternate;
      }

      #workspaces button.occupied {
        background-color: rgba(235, 188, 186, 0.7);
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
      }

      #clock {
        margin-left: 10px;
        color: rgba(235, 188, 186, 1);
        border-radius: 20px;
        background-color: rgba(25, 23, 36, 0.75);
        padding-left: 5px;
        padding-right: 5px;
      }

      #backlight {
        padding: 0px 8px 0px 4px;
      }

      #battery {
        padding: 0px 8px 0px 4px;
      }

      #battery.charging,
      #battery.plugged {
        color: rgba(156, 207, 216, 1);
      }

      @keyframes blink-battery {
        to {
          color: rgba(224, 222, 244, 1);
        }
      }

      /* CPU and Memory warning state */
      #cpu.warning,
      #disk.warning,
      #memory.warning {
        color: @gold; /* Orange color for warning */
      }

      /* CPU and Memory critical state */
      #cpu.critical,
      #disk.critical,
      #memory.critical {
        color: @love; /* Red color for critical */
      }

      /* Using steps() instead of linear as a timing function to limit cpu usage */
      #battery.warning:not(.charging) {
        color: rgba(235, 188, 186, 1);
        animation-name: blink-battery;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #battery.critical:not(.charging) {
        color: rgba(235, 111, 146, 1);
        animation-name: blink-battery;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #systray {
        color: rgba(224, 222, 244, 1);
        padding: 0px 4px;
      }

      #tray {
        padding: 0px 8px;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: rgba(235, 111, 146, 1);
      }

      #custom-power {
        padding: 0px 6px;
        color: rgba(235, 111, 146, 1);
      }

      @keyframes blink-update {
        to {
          background-color: rgba(156, 207, 216, 1);
        }
      }

      #custom-launcher {
        margin-right: 10px;
        color: rgba(235, 111, 146, 1); /* This color overrides the previous one */
        background-color: rgba(25, 23, 36, 0.75);
        border-radius: 20px;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
        padding-left: 9px;
        padding-right: 10px;
        font-size: 20px;
      }


      #custom-notification {
        background-color: rgba(25, 23, 36, 0.75);
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 20px;
        color: rgba(246, 193, 119, 1);
      }
    '';
  };
}
