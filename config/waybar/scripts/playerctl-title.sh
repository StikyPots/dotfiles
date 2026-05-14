#!/bin/bash

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
status=$(playerctl status 2>/dev/null)

max_length=30  # ⬅️ Adjust this to your preferred limit

if [ -z "$title" ]; then
  echo '{"text": "No music", "tooltip": "Nothing playing", "class": "stopped"}'
  exit
fi

full="$artist - $title"
icon=""

# Truncate if too long
if [ ${#full} -gt $max_length ]; then
  short="${full:0:$((max_length - 3))}..."
else
  short="$full"
fi

# Output valid JSON
echo "{\"text\": \"$icon  $short\", \"tooltip\": \"$full\", \"class\": \"$status\"}"
