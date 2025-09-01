#!/usr/bin/env bash
# Usando playerctl
status=$(playerctl status)
case $1 in
  --toggle) playerctl play-pause ;;
  --prev) playerctl previous ;;
  --next) playerctl next ;;
  --status) echo $status ;;
  --artist) playerctl metadata xesam:artist ;;
  --track) playerctl metadata xesam:title ;;
  --cover)
    url=$(playerctl metadata mpris:artUrl)
    echo "$HOME/.cache/spotify_art.jpg"
    wget -q -O "$HOME/.cache/spotify_art.jpg" "$url"
    ;;
esac
