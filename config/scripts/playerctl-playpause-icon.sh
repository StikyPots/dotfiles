#!/bin/bash
status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    icon="󰏤"
    tooltip="Playing"
elif [ "$status" = "Paused" ]; then
    icon=""
    tooltip="Paused"
else
    icon=""
    tooltip="Stopped"
fi
printf '{"text":"%s","tooltip":"%s"}\n' "$icon" "$tooltip"
