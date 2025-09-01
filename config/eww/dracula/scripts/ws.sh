#!/bin/bash
# Detecta workspaces do Xorg (usando wmctrl)
# Mostra workspace atual + todos disponíveis

current=$(wmctrl -d | awk '$2=="*" {print $1}')
total=$(wmctrl -d | wc -l)

echo "["
for i in $(seq 0 $((total-1))); do
    if [ "$i" -eq "$current" ]; then
        echo "{\"name\":\"$i\", \"current\":true},"
    else
        echo "{\"name\":\"$i\", \"current\":false},"
    fi
done | sed '$s/,$//'
echo "]"
