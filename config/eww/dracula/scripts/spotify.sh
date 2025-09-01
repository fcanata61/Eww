#!/bin/bash
CACHE_DIR="$HOME/.config/eww/cache"
COVER_FILE="$CACHE_DIR/spotify_cover.jpg"

mkdir -p "$CACHE_DIR"

status=$(playerctl --player=spotify status 2>/dev/null)
if [[ "$status" == "Stopped" || -z "$status" ]]; then
    echo "{\"status\":\"stopped\",\"title\":\"\",\"artist\":\"\",\"cover\":\"\"}"
    exit 0
fi

title=$(playerctl --player=spotify metadata title 2>/dev/null)
artist=$(playerctl --player=spotify metadata artist 2>/dev/null)
cover_url=$(playerctl --player=spotify metadata mpris:artUrl 2>/dev/null)

if [[ -n "$cover_url" ]]; then
    wget -q -O "$COVER_FILE" "$cover_url"
fi

echo "{
  \"status\": \"$status\",
  \"title\": \"$title\",
  \"artist\": \"$artist\",
  \"cover\": \"$COVER_FILE\"
}"
