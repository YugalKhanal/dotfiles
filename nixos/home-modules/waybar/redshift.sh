#! /usr/bin/env bash

# Check if wlsunset is running
if pgrep -x "wlsunset" > /dev/null; then
    # If running, stop it to turn off night mode
    pkill wlsunset
    # notify-send "Night Mode" "Disabled"
else
    # If not running, start wlsunset with night mode settings
    wlsunset -t 3000 -T 6500  # Set color temperature here, e.g., 3000K for night
    # notify-send "Night Mode" "Enabled"
fi
