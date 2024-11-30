#! /usr/bin/env bash
get_media_status() {
    if playerctl status &>/dev/null; then
        status=$(playerctl status)
        if [ "$status" = "Playing" ]; then
            artist=$(playerctl metadata artist)
            title=$(playerctl metadata title)
            echo "{\"text\": \"$artist - $title\", \"class\": \"playing\", \"alt\": \"playing\"}"
        else
            echo "{\"text\": \"Paused\", \"class\": \"paused\", \"alt\": \"paused\"}"
        fi
    else
        echo "{\"text\": \"\", \"class\": \"stopped\", \"alt\": \"stopped\"}"
    fi
}

# Run once immediately
get_media_status

# Then follow player events
playerctl metadata --follow 2>/dev/null | while read -r _; do
    get_media_status
done
