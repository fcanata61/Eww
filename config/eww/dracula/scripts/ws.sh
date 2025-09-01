#!/usr/bin/env bash

# Detecta qual WM está rodando
WM=$(wmctrl -m | awk 'NR==1{print $2}')

case "$WM" in
  i3)
    # Lista workspaces ativos no i3
    i3-msg -t get_workspaces | jq -r '.[] | (.num|tostring) + ":" + (if .focused then "active" else "inactive" end)'
    ;;
  bspwm)
    # Lista desktops do bspwm
    bspc query -D --names | while read -r desk; do
      if [ "$desk" = "$(bspc query -D -d focused --names)" ]; then
        echo "$desk:active"
      else
        echo "$desk:inactive"
      fi
    done
    ;;
  Openbox)
    # Openbox não tem workspaces nativos, usa EWMH (via wmctrl)
    wmctrl -d | awk '{print $1 ":" ($2=="*" ? "active" : "inactive")}'
    ;;
  dk)
    # dkWM usa EWMH parecido com bspwm
    dkcmd ws list | while read -r ws; do
      if [[ "$ws" == *"["* ]]; then
        # workspace ativo vem entre colchetes
        echo "${ws//[\[\]]/}:active"
      else
        echo "$ws:inactive"
      fi
    done
    ;;
  *)
    echo "1:active"
    ;;
esac
